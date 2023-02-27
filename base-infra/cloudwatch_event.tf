resource "aws_cloudwatch_event_rule" "AutoScalingManagedRule_rl" {
  description    = "This rule is used to route Instance notifications to EC2 Auto Scaling"
  event_bus_name = "default"
  event_pattern  = "{\"detail-type\":[\"EC2 Instance Rebalance Recommendation\",\"EC2 Spot Instance Interruption Warning\"],\"source\":[\"aws.ec2\"]}"
  is_enabled     = "true"
  name           = "AutoScalingManagedRule"
}

resource "aws_cloudwatch_event_rule" "GuardDuty_Finding_rl" {
  event_bus_name = "default"
  event_pattern  = "{\"detail\":{\"severity\":[4,4,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5,5,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6,6,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7,7,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8,8,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9]},\"detail-type\":[\"GuardDuty Finding\"],\"source\":[\"aws.guardduty\"]}"
  is_enabled     = "true"
  name           = "GuardDuty-Finding"
}

resource "aws_cloudwatch_event_target" "AutoScalingManagedRule_autoscaling_tg" {
  arn       = "arn:aws:autoscaling:us-west-2:::"
  rule      = "AutoScalingManagedRule"
  target_id = "autoscaling"
}

resource "aws_cloudwatch_event_target" "GuardDuty_Finding_tg" {
  arn = "arn:aws:sns:us-west-2:939375546786:GuardDuty_to_Email"

  input_transformer {
    input_paths = {
      Account_ID          = "$.detail.accountId"
      Finding_ID          = "$.detail.id"
      Finding_Type        = "$.detail.type"
      Finding_description = "$.detail.description"
      region              = "$.region"
      severity            = "$.detail.severity"
    }

    input_template = "\"AWS <Account_ID> has a severity <severity> GuardDuty finding type <Finding_Type> in the <region> region.\"\n\"Finding Description:\"\n\"<Finding_description>. \"\n\"For more details open the GuardDuty console at https://console.aws.amazon.com/guardduty/home?region=<region>#/findings?search=id=<Finding_ID>\"\n"
  }

  rule      = "GuardDuty-Finding"
  target_id = "Id8e54b60e-caab-490a-9455-0ef47cafd3cb"
}
