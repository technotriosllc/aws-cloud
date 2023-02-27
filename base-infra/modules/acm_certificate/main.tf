resource "aws_acm_certificate" "main" {
  domain_name = var.domain_name
  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }
  subject_alternative_names = [var.subject_alternative_names]
  validation_method = var.validation_method
}
