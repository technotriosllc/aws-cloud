variable "environment" {
  description = "Application environment"
  default     = null
  type        = string
}
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
  description = "Public Subnet for VPC."
  type        = list(string)
}

variable "private_subnet" {
  description = "Private Subnet for VPC."
  type        = list(string)
}

variable "az" {
  type = list(string)

}

variable "internal_domain" {
  type        = string
  description = "This is the name of the hosted zone."
}

variable "enabled_hosted_zone" {
  type        = bool
  description = "To check, for enabling hosted zone. default FALSE"
  default     = false
}

variable "record_type" {
  type        = string
  description = "(Required) The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
}

variable "ttl" {
  type        = number
  description = "(Required for non-alias records) The TTL of the record."
  default     = 300
}

variable "eks_cluster_name" {
  description = "Elastic kubernetes Service Cluster Name."
  type        = string
}

variable "eks_env_code" {
  description = "Environment code Expected values: dev, qa, staging, uat, prod."
  type        = string
}

variable "eks_node_type" {
  description = "Instance type for node group."
  type        = string
}

variable "eks_vpc_cidr" {
  description = "CIDR block for VPC."
  type        = string
}

variable "eks_max_size" {
  description = "Node group max node size."
  type        = number
}

variable "eks_min_size" {
  description = "Node group minimum node size."
  type        = number
}

variable "eks_desired_size" {
  description = "Node group desired count."
  type        = number
}

variable "eks_az" {
  description = "AWS Availability zone"
  type        = list(string)
}

variable "eks_public_subnet" {
  description = "Public subnet for AWS VPC."
  type        = list(string)
}

variable "eks_private_subnet" {
  description = "Private Subnet for AWS VPC."
  type        = list(string)
}

variable "func_name" {
  description = "Lambda function Name."
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

variable "aws_account_id" {
  type = string
  description = "Provide AWS account ID."
}