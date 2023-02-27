module "plasmic_dev" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.dev"
}

resource "aws_route53_record" "star_tunnel_dev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "*.tunnel.plasmic.dev"
  records                          = ["cd.localhost.run"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}

resource "aws_route53_record" "acm_validations_dev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "_c946d70cd136c8af3f1a170cf4d8a78b.host.plasmic.dev"
  records                          = ["_aeaea8744cb1cc4ab81e0082ee89a755.jddtvkljgg.acm-validations.aws."]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}

resource "aws_route53_record" "tunnel_dev_TXT" {
  multivalue_answer_routing_policy = "false"
  name                             = "_lhr.tunnel.plasmic.dev"
  records                          = ["e0bb9127-de54-4c7c-a617-b7f8edd8c3d0"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}

resource "aws_route53_record" "host_dev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "host.plasmic.dev"
  records                          = ["doiwpn3rg2gfs.cloudfront.net"]
  ttl                              = "60"
  type                             = "CNAME"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}

resource "aws_route53_record" "plasmic_dev_A" {
  multivalue_answer_routing_policy = "false"
  name                             = "plasmic.dev"
  records                          = ["100.21.84.39"]
  ttl                              = "60"
  type                             = "A"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}


resource "aws_route53_record" "tunnel_dev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "tunnel.plasmic.dev"
  records                          = ["cd.localhost.run"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmic_dev.hosted_zone_id
}