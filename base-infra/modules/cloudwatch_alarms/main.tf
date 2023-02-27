
resource "aws_cloudwatch_metric_alarm" "default" {
  alarm_name                = var.alarm_name
  alarm_description         = var.alarm_description
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  insufficient_data_actions = var.insufficient_data_actions
  actions_enabled           = var.actions_enabled
  datapoints_to_alarm       = var.datapoints_to_alarm
  dimensions                = var.dimensions_enabled == true ? var.dimensions : null
  alarm_actions             = var.alarm_actions
  treat_missing_data        = var.treat_missing_data
}
