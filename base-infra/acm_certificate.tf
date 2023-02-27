module "studio_cloudfront_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "studio-cloudfront.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "studio-cloudfront.plasmic.app"
  validation_method                           = "DNS"
}

module "devtun_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "devtun.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "devtun.plasmic.app"
  validation_method                           = "DNS"
}

module "studio_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "studio.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "studio.plasmic.app"
  validation_method                           = "DNS"
}

module "gerrit_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "gerrit.aws.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "gerrit.aws.plasmic.app"
  validation_method                           = "DNS"
}

module "site_assets_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "site-assets.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "site-assets.plasmic.app"
  validation_method                           = "DNS"
}

module "host_plasmicdev_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "host.plasmicdev.com"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "host.plasmicdev.com"
  validation_method                           = "DNS"
}

module "codegen_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "codegen.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "codegen.plasmic.app"
  validation_method                           = "DNS"
}

module "star_devtun_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "*.devtun.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "*.devtun.plasmic.app"
  validation_method                           = "DNS"
}

module "img_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "img.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "img.plasmic.app"
  validation_method                           = "DNS"
}

module "jenkins_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "jenkins.aws.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "jenkins.aws.plasmic.app"
  validation_method                           = "DNS"
}

module "static1_plasmic_app_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "static1.plasmic.app"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "static1.plasmic.app"
  validation_method                           = "DNS"
}

module "host_plasmic_dev_crt" {
  source                                      = "./modules/acm_certificate"
  region                                      = "us-east-1"
  domain_name                                 = "host.plasmic.dev"
  certificate_transparency_logging_preference = "ENABLED"
  subject_alternative_names                   = "host.plasmic.dev"
  validation_method                           = "DNS"
}


