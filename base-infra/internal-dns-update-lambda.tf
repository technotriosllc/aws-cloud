resource "aws_cloudwatch_event_rule" "dns_record_event_rule" {
  name          = "internal-dns-update-rule"
  tags          = { "ManagedBy" = "Managed by Terraform" }
  event_pattern = <<EOF
{
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "RebootInstances",
      "StartInstances",
      "RunInstances",
      "TerminateInstances"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "dns_record_event_target" {
  arn       = aws_lambda_function.dns_record_lambda_function.arn
  rule      = aws_cloudwatch_event_rule.dns_record_event_rule.name
  target_id = "internal-dns-record-update"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dns_record_lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.dns_record_event_rule.arn
}

data "aws_iam_policy" "AWS_Lambda_Basic_Execution_Role" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy" "ec2_read_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

data "aws_iam_policy" "route53_access" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

data "archive_file" "lambda_func_zip" {
  type             = "zip"
  source_dir       = "${path.module}/lambda_function"
  output_file_mode = "0666"
  output_path      = "${path.module}/lambda_function.zip"
}


resource "aws_lambda_function" "dns_record_lambda_function" {
  function_name    = var.func_name
  timeout          = 15
  role             = aws_iam_role.lambda_func_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256(data.archive_file.lambda_func_zip.output_path)
  environment {
    variables = {
      dns_record_ttl  = var.dns_record_ttl
      dns_record_type = var.dns_record_type
      region          = var.region
      hosted_zone     = var.hosted_zone
    }
  }
  tags = { "ManagedBy" = "Managed by Terraform" }
}

resource "aws_iam_role" "lambda_func_role" {
  name               = var.lambda_func_role
  tags               = { "ManagedBy" = "Managed by Terraform" }
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}



resource "aws_iam_role_policy_attachment" "basic_execution_policy" {
  policy_arn = data.aws_iam_policy.AWS_Lambda_Basic_Execution_Role.arn
  role       = aws_iam_role.lambda_func_role.name
}

resource "aws_iam_role_policy_attachment" "ec2_read_access_policy" {
  policy_arn = data.aws_iam_policy.ec2_read_policy.arn
  role       = aws_iam_role.lambda_func_role.name
}

resource "aws_iam_role_policy_attachment" "route53_write_policy" {
  policy_arn = data.aws_iam_policy.route53_access.arn
  role       = aws_iam_role.lambda_func_role.name
}