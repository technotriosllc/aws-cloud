variable "instance_name" {
  default     = null
  description = "Name to be used on EC2 instance created."
  type        = string
}

variable "ami_id" {
  default     = null
  description = "AMI ID to be used for the instance."
  type        = string
}

variable "availability_zone" {
  description = "AZ to start the instance in."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The type of instance to launch instance."
  default     = null
  type        = string
}

variable "subnet_id" {
  description = "The VPC Subnet ID to lunch instance."
  type        = string
  default     = null
}

variable "key_name" {
  description = "Key Name of the Key Pair to use for the instance; Which can be managed using the 'aws_key_pair' resource."
  default     = null
  type        = string
}

variable "private_ip" {
  default     = null
  description = "Private IP address to associate with the instance."
  type        = string
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
}

variable "public_ip_enabled" {
  default     = false
  description = "If set true, it will assign public Ip to instance."
  type        = bool
}

variable "ebs_block_device" {
  description = "Customize details about the ebs block device of instance."
  default     = null
  type        = list(any)
}

variable "security_group" {
  description = "AWS security group IDs to associate with."
  type        = string
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set."
  type        = bool
  default     = false
}

variable "enable_eip" {
  type    = bool
  default = false
}

variable "volume_type" {
  description = "Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2."
  default     = "gp2"
  type        = string
}

variable "volume_size" {
  description = "Size of the volume in gibibytes (GiB)."
  type        = number
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination. Defaults to true"
  type        = bool
}

variable "owner" {
  type        = string
  description = "Owner details required for instance tagging."
}

variable "env" {
  type        = string
  description = "Environment details required for instance tagging"
}

variable "user_data_enabled" {
  type        = bool
  description = "Check before passing user data. Default 'false'"
  default     = false
}

variable "iam_instance_profile" {
  type        = string
  description = "Role to be attached to instance."

}

variable "linux_shell_profile" {
  description = "The ShellProfile to use for linux based machines."
  default     = <<EOF
            exec /bin/bash
            timestamp=$(date)
            user=$(whoami)
            echo $timestamp && echo "Welcome $user"'!'
            echo "You have logged in to a production instance. Note that all session activity is being logged."
      EOF
  type        = string
}

variable "windows_shell_profile" {
  description = "The shellProfile to use the windows based machines."
  default     = <<EOF
            $timestamp = (Get-Date).ToString("yyyy-MM-ddTH:mm:ssZ")
            $splitName = (whoami).Split("/")
            $user = $splitName[1]
            Write-Host $timestamp
            Write-Host "Welcome $user!"
            Write-Host "You have logged in to a production instance. Not that all session activity is being logged."
        EOF
  type        = string
}

variable "managed_by" {
  default = "Managed by Terraform"
}
