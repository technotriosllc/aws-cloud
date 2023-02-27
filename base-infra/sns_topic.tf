resource "aws_sns_topic" "slack_sns_topic" {
  application_success_feedback_sample_rate = "0"
  content_based_deduplication              = "false"
  fifo_topic                               = "false"
  firehose_success_feedback_sample_rate    = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "GuardDuty-to-Slack"

  policy = <<POLICY
{
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish"
      ],
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "939375546786"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:sns:us-west-2:939375546786:GuardDuty-to-Slack",
      "Sid": "__default_statement_ID"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  sqs_success_feedback_sample_rate = "0"
}

resource "aws_sns_topic" "guard_duty_to_email" {
  application_success_feedback_sample_rate = "0"
  content_based_deduplication              = "false"
  fifo_topic                               = "false"
  firehose_success_feedback_sample_rate    = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "GuardDuty_to_Email"

  policy = <<POLICY
{
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish"
      ],
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "939375546786"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:sns:us-west-2:939375546786:GuardDuty_to_Email",
      "Sid": "__default_statement_ID"
    },
    {
      "Action": "sns:Publish",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Resource": "arn:aws:sns:us-west-2:939375546786:GuardDuty_to_Email",
      "Sid": "AWSEvents_GuardDuty-Finding_Id8e54b60e-caab-490a-9455-0ef47cafd3cb"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  sqs_success_feedback_sample_rate = "0"
}

resource "aws_sns_topic" "prod_disk_full_sns" {
  application_success_feedback_sample_rate = "0"
  content_based_deduplication              = "false"
  fifo_topic                               = "false"
  firehose_success_feedback_sample_rate    = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "Prod_Disk_Full"

  policy = <<POLICY
{
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "939375546786"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full",
      "Sid": "__default_statement_ID"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  sqs_success_feedback_sample_rate = "0"
}

resource "aws_sns_topic_subscription" "prod_disk_full_subscription" {
  endpoint             = "https://global.sns-api.chatbot.amazonaws.com"
  protocol             = "https"
  raw_message_delivery = "false"
  topic_arn            = aws_sns_topic.prod_disk_full_sns.arn
}

resource "aws_sns_topic_subscription" "slack_subscription" {
  endpoint             = "https://global.sns-api.chatbot.amazonaws.com"
  protocol             = "https"
  raw_message_delivery = "false"
  topic_arn            = aws_sns_topic.slack_sns_topic.arn
}