
resource "aws_security_group" "main" {
  name   = var.name
  vpc_id = var.vpc_id
  description = var.description
  dynamic "ingress" {
    for_each = var.ingress_info
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks != "" ? [ingress.value.cidr_blocks] : []
      description      = ingress.value.description != "" ? ingress.value.description : ""
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks != "" ? [ingress.value.ipv6_cidr_blocks] : []
      security_groups  = ingress.value.security_groups != "" ? [ingress.value.security_groups] : []
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = var.tags
}