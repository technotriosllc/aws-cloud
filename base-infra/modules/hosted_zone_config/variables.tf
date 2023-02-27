variable "region" {}
variable "domain" {
  type        = string
  description = "This is the name of the hosted zone."
}

variable "enabled_hosted_zone" {
  type        = bool
  description = "To check, for enabling hosted zone. default FALSE"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "(Required) ID of the VPC to associate."
}

variable "associated_vpc_id" {
  type = string
}

