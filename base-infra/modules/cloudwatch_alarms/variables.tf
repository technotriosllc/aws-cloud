variable "alarm_name" {
  type        = string
  description = " The descriptive name for the alarm. This name must be unique within the user's AWS account"
}

variable "comparison_operator" {
  description = " The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models."
  type        = string
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "metric_name" {
  type        = string
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied."
}

variable "statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric."
}

variable "threshold" {
  type        = number
  default     = 40
  description = "The value against which the specified statistic is compared."
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
}

variable "alarm_actions" {
  type        = list(any)
  default     = []
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state."
}

variable "insufficient_data_actions" {
  default     = []
  type        = list(any)
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state."
}

variable "actions_enabled" {
  type        = bool
  default     = true
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = string
}

variable "dimensions" {
  default     = {}
  description = "Dimensions for metrics."
}

variable "dimensions_enabled" {
  description = "Check if the alarm needs dimensions"
  default     = false
  type        = bool
}

variable "treat_missing_data" {
  type        = string
  default     = "missing"
  description = "Sets how this alarm is to handle missing data points."
}