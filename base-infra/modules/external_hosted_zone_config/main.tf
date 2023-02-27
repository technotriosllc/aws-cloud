
resource "aws_route53_zone" "hosted_zone" {
  name          = var.domain
  comment       = "Managed by Terraform"
  force_destroy = false
}




