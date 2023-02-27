resource "aws_cloudwatch_event_rule" "dns_record_event_rule" {
  name          = "internal-dns-update-rule"
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