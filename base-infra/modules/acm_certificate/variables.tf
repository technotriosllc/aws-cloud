variable "region" {
  type = string
}
variable "domain_name" {
  description = "(Required) Domain name for which the certificate should be issued"
  type        = string
}

variable "certificate_transparency_logging_preference" {
  description = "Whether certificate details should be added to a certificate transparency log."
  type        = string
}
variable "subject_alternative_names" {
  description = "Set of domains that should be SANs in the issued certificate."
  type        = string
}
variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  type        = string
}