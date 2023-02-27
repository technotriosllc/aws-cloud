resource "aws_iam_role" "instance_role" {
  name               = "SSM-instance-role"
  path               = "/"
  tags               = { "ManagedBy" = "Managed by Terraform" }
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
    {
          "Action" : "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "plasmic-ssm-instance-profile"
  role = aws_iam_role.instance_role.name
  tags = { "ManagedBy" = "Managed by Terraform" }
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_policy_attachment" {
  policy_arn = "arn:aws-us-gov:iam:aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.instance_role.name
}