module "internal_hosted_zone" {
  source              = "./modules/hosted_zone_config"
  enabled_hosted_zone = true
  domain              = var.internal_domain
  vpc_id              = module.base_vpc.vpc_id
  region              = var.region
  associated_vpc_id   = module.eks_cluster.eks_vpc_id
  depends_on = [
    module.base_vpc,
    module.create_ec2_instance
  ]
}

module "external_plasmic_app" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.app"
}
module "plasmic_website" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.website"
}

module "plasmic_website_b" {
  source = "./modules/external_hosted_zone_config"
  domain = "plasmic.website"
}

resource "aws_route53_record" "plasmic_app_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "76.76.21.21",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_MX" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "plasmic.app."
  type    = "MX"
  ttl     = 300
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_TXT" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "plasmic.app."
  type    = "TXT"
  ttl     = 300
  records = [
    "google-site-verification=ekWwCra-4WKLB3OnStGVKWEfbLKNZM3JvqWEWbf50ow",
    "v=spf1 include:_spf.google.com include:amazonses.com ~all",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_TXT" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_amazonses.plasmic.app."
  type    = "TXT"
  ttl     = 300
  records = [
    "U30UCyQ3GhCph65Y7/+y3r/a2Cc0Ag3w8x1wL6yCXr0=",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_dmarc_TXT" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_dmarc.plasmic.app."
  type    = "TXT"
  ttl     = 60
  records = [
    "v=DMARC1; p=reject; rua=mailto:dmarc@plasmic.app; ruf=mailto:dmarc@plasmic.app",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_d2xacp7ampmvzatyptc2tyrf23bf7u2t_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "d2xacp7ampmvzatyptc2tyrf23bf7u2t._domainkey.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "d2xacp7ampmvzatyptc2tyrf23bf7u2t.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

#resource "aws_route53_record" "plasmic_app_google_domainkey_TXT" {
#  zone_id = module.external_plasmic_app.hosted_zone_id
#  name    = "google._domainkey.plasmic.app."
#  type    = "TXT"
#  ttl     = 300
#  records = [
#    flatten("v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAglnImrCn4+K3Y2i7Iezwu8fT2l8WF2YyDUv68OtIyrLyYImD6v8jTdXCw35aj1FpZqktp8kPQnpk8lXWCETyl+osDDnvJdwZ3nicEZwN9AtuNtGXj0QDusZclisngLoKFR7JdRDGTqCNzjWeOGycN/""Vrv5ADctI5bLUn6qxMqSYQ58uLfacRa7w061tWpD0zHcLOs6nwoI/xrO3InwNVbG1Zyiz6QpF+WnruEaGcq6LCGUTC89PyvMGdC4NTCfPI9JVrfHHEis5CYcewR+WdqBtUKTeANkMxx5iwRNTX4GkBY+7oaGWZ0TmzUE6U3ysh95NRCaDM2wNsji8d+X14yQIDAQAB"),
#  ]
#  allow_overwrite = true
#}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_iwqenifmx627zbhczrbzfpifyi7durpw_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "iwqenifmx627zbhczrbzfpifyi7durpw._domainkey.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "iwqenifmx627zbhczrbzfpifyi7durpw.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_uzxrk4axrtjpvdqwgyhuy26ipy65u5eu_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "uzxrk4axrtjpvdqwgyhuy26ipy65u5eu._domainkey.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "uzxrk4axrtjpvdqwgyhuy26ipy65u5eu.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_analytics_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "analytics.plasmic.app."
  type    = "CNAME"
  alias {
    name                   = "posthog.plasmic.app."
    zone_id                = "Z2ODB6LEHQTNVF"
    evaluate_target_health = true
  }
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_acme_challenge_analytics_TXT" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_acme-challenge.analytics.plasmic.app."
  type    = "TXT"
  ttl     = 3600
  records = [
    "w-5IwBZpWwJpvnar0PFPITH3Cd78mx0dBwxI7C1I1y4",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_db_aws_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "db.aws.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "100.21.84.39",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_gerrit_origin_aws_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "gerrit-origin.aws.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "34.211.182.188",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_gerrit_aws_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "gerrit.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "gerrit-origin.aws.plasmic.app",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_668f7556c3e2e70a00eb56836b743d7e_gerrit_aws_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_668f7556c3e2e70a00eb56836b743d7e.gerrit.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_3ec8035e887c90d579d03a2f1e302a1a.hkmpvcwbzw.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_grafana_aws_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "grafana.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "a49a6081b1f1142c9ba6556fed797d47-707994955.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_jenkins_origin_aws_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "jenkins-origin.aws.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "34.211.182.188",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_jenkins_aws_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "jenkins.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "jenkins-origin.aws.plasmic.app",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_7b13010340ad7aa0b2d9ba8af4f709ae_jenkins_aws_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_7b13010340ad7aa0b2d9ba8af4f709ae.jenkins.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_1628da4ae0cf87abdf747230c41199a8.hkmpvcwbzw.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_kb_aws_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "kb.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "a8c5eb20375ae4123912e93f819246cb-1543241012.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_kibana_aws_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "kibana.aws.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "a8c5eb20375ae4123912e93f819246cb-1543241012.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_studio_aws_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "studio.aws.plasmic.app."
  type    = "A"
  ttl     = 300
  records = [
    "172.31.37.139",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_blog_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "blog.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_blog0_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "blog0.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_clickhouse_db_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "clickhouse-db.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "a0c446de22b2c4535ba7af77345fae10-177145034.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_cname_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "cname.plasmic.app."
  type    = "A"
  ttl     = 30
  records = [
    "76.76.21.21",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_codegen_origin_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "codegen-origin.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "a846b4e416ff04bfc9a27a1ba51a5710-1511412559.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_codegen_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "codegen.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "d2675tnxl66y4d.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_0c22416c6b46f8520d46eb55c49af200_codegen_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_0c22416c6b46f8520d46eb55c49af200.codegen.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_80734c43a505436b3e2f4e161c89fc13.qqqfmgwtgn.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_data_origin_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "data-origin.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "a9ba15b283f764d1eb8b544eda5ee85b-441622174.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_data_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "data.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "d1gadqr0d7oip1.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_71e1d98247c8e323bfc37a402baa58f8_data_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_71e1d98247c8e323bfc37a402baa58f8.data.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_0f93ef57724fe80bc151f8fa1aa6351d.kdbplsmznr.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_devtun_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "devtun.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "54.214.118.93",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_star_devtun_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "*.devtun.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "54.214.118.93",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_a38e4702604efd0d24ef5d56962fa2a1_devtun_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_a38e4702604efd0d24ef5d56962fa2a1.devtun.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_5283677225d52a654cc39a88ea2d9985.qqqfmgwtgn.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_docs_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "docs.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_forum_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "forum.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "52.43.245.86",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_forum_MX" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "forum.plasmic.app."
  type    = "MX"
  ttl     = 1800
  records = [
    "10 inbound-smtp.us-west-2.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_forum_TXT" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_amazonses.forum.plasmic.app."
  type    = "TXT"
  ttl     = 1800
  records = [
    "Mb18xYx5p4nDrKcM76u6w+TPQULKl5MGwgVZTBEADBw=",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_3nzjntwps5da7ppyc3qb6bjm2dtrd3w3_forum_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "3nzjntwps5da7ppyc3qb6bjm2dtrd3w3._domainkey.forum.plasmic.app."
  type    = "CNAME"
  ttl     = 1800
  records = [
    "3nzjntwps5da7ppyc3qb6bjm2dtrd3w3.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_dxjlha4htitt7w4kjgy4gm73d5lv5lj7_forum_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "dxjlha4htitt7w4kjgy4gm73d5lv5lj7._domainkey.forum.plasmic.app."
  type    = "CNAME"
  ttl     = 1800
  records = [
    "dxjlha4htitt7w4kjgy4gm73d5lv5lj7.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_amazonses_dkim_wp5dpyoecnzjmx7avc6hajwo5bg77a6u_forum_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "wp5dpyoecnzjmx7avc6hajwo5bg77a6u._domainkey.forum.plasmic.app."
  type    = "CNAME"
  ttl     = 1800
  records = [
    "wp5dpyoecnzjmx7avc6hajwo5bg77a6u.dkim.amazonses.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_help_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "help.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_hostingtest_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "hostingtest.plasmic.app."
  type    = "CNAME"
  ttl     = 30
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_img_origin_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "img-origin.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "afd5b7ee577154d7793aeca945ed96c6-913583283.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_img_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "img.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "d395dbw2yrm2nr.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_bfb8f7d4b91034b7a98bd75c6b716e69_img_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_bfb8f7d4b91034b7a98bd75c6b716e69.img.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_6356f22ee819ebcb05e645b8b7706961.qqqfmgwtgn.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_mt_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "mt.plasmic.app."
  type    = "CNAME"
  ttl     = 120
  records = [
    "x.gmtrack.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_posthog_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "posthog.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "a49a6081b1f1142c9ba6556fed797d47-707994955.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_prod_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "prod.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "100.21.84.39",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_site_assets_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "site-assets.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "dycylxv34gsu1.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_7ffb0ab5a6f5d11fbea7a7df78863a41_site_assets_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_7ffb0ab5a6f5d11fbea7a7df78863a41.site-assets.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_349527106f2ea0ed16a8f9ae374bf999.zjfbrrwmzc.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_static1_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "static1.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "d3mptpzf6vzrya.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_8474061dade0022b489943dd5b930463_static1_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_8474061dade0022b489943dd5b930463.static1.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_3286013ffa181ec774ab3fc2237305dc.xrchbtpdjs.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_status_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "status.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "stats.pingdom.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_strapi_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "strapi-app.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "a49a6081b1f1142c9ba6556fed797d47-707994955.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_studio_cloudfront_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "studio-cloudfront.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "d3w1c8m4oy0jjc.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_fb0435c6f55f76e118550ea20f619889_studio_cloudfront_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_fb0435c6f55f76e118550ea20f619889.studio-cloudfront.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_620f5ff17d2051ec553d2228f44e3374.zzxlnyslwt.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_studio_origin_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "studio-origin.plasmic.app."
  type    = "A"
  ttl     = 60
  records = [
    "100.21.84.39",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_studio_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "studio.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "doiwpn3rg2gfs.cloudfront.net",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_aws_acm_e1b6f45aec60743880b38f750bc39772_studio_plasmic_app_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "_e1b6f45aec60743880b38f750bc39772.studio.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "_04f6d3677cfa1aec42090d2a78431875.hkmpvcwbzw.acm-validations.aws.",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_test_forum_jenkins_origin_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "test-forum-jenkins-origin.plasmic.app."
  type    = "A"
  ttl     = 300
  records = [
    "34.211.182.188",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_test_forum_jenkins_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "test-forum-jenkins.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "test-forum-jenkins-origin.plasmic.app",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_test_forum_origin_A" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "test-forum-origin.plasmic.app."
  type    = "A"
  ttl     = 300
  records = [
    "34.211.182.188",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_test_forum_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "test-forum.plasmic.app."
  type    = "CNAME"
  ttl     = 300
  records = [
    "prod-loadbalancer-1261759973.us-west-2.elb.amazonaws.com",
  ]
  allow_overwrite = true
}

resource "aws_route53_record" "plasmic_app_www_CNAME" {
  zone_id = module.external_plasmic_app.hosted_zone_id
  name    = "www.plasmic.app."
  type    = "CNAME"
  ttl     = 60
  records = [
    "cname.vercel-dns.com",
  ]
  allow_overwrite = true
}

