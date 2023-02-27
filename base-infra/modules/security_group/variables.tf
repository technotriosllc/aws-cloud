variable "region" {
  default     = ""
  type        = string
  description = "AWS region to deploy security group."
}
variable "ingress_info" {
  type        = list(map(string))
  description = "Ingress info map."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID, required to create security group"
  default     = ""
}
variable "name" {
  type        = string
  description = "Security group name"
  default     = ""
}
variable "tags" {
  type        = any
  description = "Resource tag"
}

variable "description" {
  default = ""
}