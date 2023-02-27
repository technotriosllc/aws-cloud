variable "password_reuse_prevention" {
  default     = 10
  description = "Prevent reuse of the give amount of passwords."
  type        = number
}

variable "max_password_age" {
  default     = 90
  description = "The Maximum age before a password will expire."
}