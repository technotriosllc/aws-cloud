variable "region" {
  description = "AWS region to AWS instance."
  default     = null
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR to create VPC."
  default     = null
  type        = string
}

variable "public_subnet" {
  default     = null
  description = "Public Subnet for VPC."
  type        = list(string)
}

variable "private_subnet" {
  default     = null
  description = "Private Subnet for VPC."
  type        = list(string)
}

variable "vpc_name" {
  default     = ""
  description = "Name tag for VPC"
  type        = string
}

variable "az" {
  default     = null
  description = "AWS Availability Zone to create subnets"
  type        = list(string)
}