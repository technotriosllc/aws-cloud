
resource "aws_route53_zone" "hosted_zone" {
  name          = var.enabled_hosted_zone ? var.domain : 0
  comment       = "Managed by Terraform"
  force_destroy = false
  vpc {
    vpc_id     = var.vpc_id
    vpc_region = var.region
  }
  vpc {
    vpc_id     = var.associated_vpc_id
    vpc_region = var.region
  }
}




