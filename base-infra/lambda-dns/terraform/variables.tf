variable "func_name" {
  description = "Lambda function Name."
  type        = string
}


variable "region" {
  description = "AWS region to deploy lambda function."
  type        = string
}

variable "lambda_func_role" {
  description = "AWS lambda function attached role name"
  type        = string
}

variable "hosted_zone" {
  type    = string
  default = ""
}

variable "dns_record_ttl" {
  type        = number
  default     = 60
  description = "The TTL of the record."
}

variable "dns_record_type" {
  description = "The record type."
  type        = string
  default     = "A"
}