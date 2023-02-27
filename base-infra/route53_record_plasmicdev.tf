module "plasmicdev_com" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmicdev.com"
}

resource "aws_route53_record" "plasmicdev_host_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "_e921eb8a56f42ba17fe40b8f5692178f.host.plasmicdev.com"
  records                          = ["_4607c65b8d6c3750e16591545296233a.kgnrpmcdhl.acm-validations.aws."]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmicdev_com.hosted_zone_id
}

resource "aws_route53_record" "cname_plasmicdev_A" {
  multivalue_answer_routing_policy = "false"
  name                             = "cname.plasmicdev.com"
  records                          = ["76.76.21.21"]
  ttl                              = "60"
  type                             = "A"
  zone_id                          = module.plasmicdev_com.hosted_zone_id
}

resource "aws_route53_record" "host_plasmicdev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "host.plasmicdev.com"
  records                          = ["decohuet81wje.cloudfront.net"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmicdev_com.hosted_zone_id
}
