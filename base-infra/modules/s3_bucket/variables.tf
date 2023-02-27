variable "grant" {
  description = "An ACL policy grant. Conflicts with `acl`"
  type        = any
  default     = []
}

variable "owner" {
  description = "Bucket owner's display name and ID. Conflicts with `acl`"
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  default = "Bucket Name"
  type    = string
}

variable "enable_bucket_logging" {
  description = "Set it to true to enable bucket logging."
  type = bool

}

variable "object_lock_enabled" {
  description = "Whether S3 bucket should have an Object Lock configuration enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "attach_policy" {
  description = "Controls if S3 bucket should have bucket policy attached."
  type        = string
}

variable "bucket_policy" {
  description = " Text of the policy. Although this is a bucket policy rather than an IAM policy"
  type        = any
}

variable "versioning" {
  description = "versioning configuration."
  type        = string
  default     = "Enabled"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
}
variable "bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  type        = string
}

variable "mfa_delete" {
  description = "Required if versioning_configuration mfa_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device."
  type        = string
}

variable "enable_s3_bucket_acl" {
  description = "Set it to true to create s3 bucket acl."
  type = bool
}

variable "enabled_sse_conf" {
  description = "Set it to true to create sse configuration."
  type = bool
}

variable "enable_lifecycle_conf" {
  description = "Set it to true to create bucket lifecycle configuration."
  type = bool
}

variable "enable_cors_conf" {
  description = "Set it to true to create bucket cors configuration."
  type = bool
}