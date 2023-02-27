module "plasmic_link" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.link"
}
resource "aws_route53_record" "prox1_plasmic_link" {
  multivalue_answer_routing_policy = "false"
  name                             = "*.prox1.plasmic.link"
  records                          = ["studio-origin.plasmic.app"]
  ttl                              = "60"
  type                             = "CNAME"
  zone_id                          = module.plasmic_link.hosted_zone_id
}

resource "aws_route53_record" "acme_challenge_prox1" {
  multivalue_answer_routing_policy = "false"
  name                             = "_acme-challenge.prox1.plasmic.link"
  records                          = ["0DbuwY0IhKcnu6p9fO_-QLUs_TxBy2STLw08YZUe0gs"]
  ttl                              = "60"
  type                             = "TXT"
  zone_id                          = module.plasmic_link.hosted_zone_id
}