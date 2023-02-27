module "plasmiq_app" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmiq.app"
}

resource "aws_route53_record" "host_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "host.plasmiq.app"
  records                          = ["doiwpn3rg2gfs.cloudfront.net"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_four_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest4.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_five_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest5.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hostingtest_six_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest6.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_seven_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest7.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_eight_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest8.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_nine_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest9.plasmiq.app"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}

resource "aws_route53_record" "mt_q_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "mt.plasmiq.app"
  records                          = ["x.gmtrack.net"]
  ttl                              = "60"
  type                             = "CNAME"
  zone_id                          = module.plasmiq_app.hosted_zone_id
}