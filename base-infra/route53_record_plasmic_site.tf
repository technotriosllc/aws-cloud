module "plasmic_site" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.site"
}

resource "aws_route53_record" "plasmicops_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "*.plasmic.site"
  records                          = ["plasmicops.github.io"]
  ttl                              = "60"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "admin_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "admin.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "api_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "api.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "app_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "app.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "blog_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "blog.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "cloud_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "cloud.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "dev_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "dev.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "email_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "email.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "forum_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "forum.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "ftp_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "ftp.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "help_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "help.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "hostingtest_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest.plasmic.site"
  records                          = ["cname.vercel-dns.com"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "hosting_test_two_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest2.plasmic.site"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "hostingtest_A" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest3.plasmic.site"
  records                          = ["8.8.8.8"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "hostingtest_four_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest4.plasmic.site"
  records                          = ["example.com"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "hostingtest_eight_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "hostingtest8.plasmic.site"
  records                          = ["cname.plasmic.app"]
  ttl                              = "30"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "imap_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "imap.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "mail_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "mail.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "ns_one_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "ns1.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "ns_two_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "ns2.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "ns_three_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "ns3.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "pop_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "pop.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "pop_three_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "pop3.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "secure_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "secure.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "server_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "server.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "shop_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "shop.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "smtp_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "smtp.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "store_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "store.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "studio_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "studio.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "support_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "support.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "test_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "test.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "webmail_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "webmail.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}

resource "aws_route53_record" "domain_CNAME" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.plasmic.site"
  records                          = ["www.plasmic.app"]
  ttl                              = "0"
  type                             = "CNAME"
  zone_id                          = module.plasmic_site.hosted_zone_id
}