resource "aws_ses_domain_identity" "forum_ses_domain" {
  domain = "forum.plasmic.app"
}

resource "aws_ses_domain_identity" "plasmic_ses_domain" {
  domain = "plasmic.app"
}