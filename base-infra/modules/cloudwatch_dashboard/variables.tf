variable "dashboard_name" {
  type = string
  description = "Name for Cloudwatch dashboard."
}
variable "dashboard_body" {
  type = any
  description = "Details fo cloudwatch dashboard design."
}