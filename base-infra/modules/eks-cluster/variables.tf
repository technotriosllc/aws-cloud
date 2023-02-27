variable "region" {
  type        = string
  description = "AWS region to deploy eks cluster."
}
variable "cluster_name" {
  type        = string
  description = "Elastic kubernetes Service Cluster Name."
}

variable "env_code" {
  type        = string
  description = "Environment code Expected values: dev, qa, staging, uat, prod"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC."
}

variable "max_size" {
  type        = number
  description = "Node group max node size."
  default     = 1
}

variable "min_size" {
  type        = number
  description = "Node group minimum node size."
  default     = 1
}

variable "desired_size" {
  type        = number
  description = "Node group desired count."
  default     = 1
}

variable "node_type" {
  type        = string
  description = "Instance type for node group."
  default     = "c6a.xlarge"
}

variable "sg_suffix" {
  type    = string
  default = "SG"
}

variable "az" {
  default     = null
  description = "AWS Availability zone"
  type        = list(string)
}

variable "private_subnet" {
  default     = null
  description = "Private Subnet for AWS VPC."
  type        = list(string)
}

variable "public_subnet" {
  default     = null
  description = "Public subnet for AWS VPC."
  type        = list(string)
}





