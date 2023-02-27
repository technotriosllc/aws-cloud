module "amplify_stage_deployment" {
  source              = "./modules/s3_bucket"
  bucket_name         = "amplify-amplify6bd1846cb0544-staging-232742-deployment"
  object_lock_enabled = false
  tags = {
    OWNER              = "yang"
    "user:Application" = "amplifyhomes"
    "user:Stack"       = "staging"
  }
  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner         = {}
  attach_policy = ""

  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "amplify_dev_deployment" {
  source              = "./modules/s3_bucket"
  bucket_name         = "amplify-amplifyhomes-devv-232718-deployment"
  object_lock_enabled = false
  tags = {
    OWNER              = "yang"
    "user:Application" = "amplifyhomes"
    "user:Stack"       = "devv"
  }
  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }

  ]
  owner         = {}
  attach_policy = ""

  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "aws_cloudtrail_logs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "aws-cloudtrail-logs-939375546786-9c522d80"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }
  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Disabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }

  ]
  owner         = {}
  attach_policy = ""

  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "codegen_logs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "codegen-logs"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    },
    {
      id          = "c4c1ede66af53448b93c283ce9448c4ba468c9432aa01d700d3878632f77d2d0"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_clips" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-clips"
  object_lock_enabled = false
  tags = {
    ContainsUserData = "true"
    OWNER            = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_cypress" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-cypress"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_codegen_origin_elb_logs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-codegen-origin-elb-logs"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_discourse_backups" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-discourse-backups"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_discourse_uploads" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-discourse-uploads"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_grafana" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-grafana"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_loader_assets" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-loader-assets"
  object_lock_enabled = false
  tags = {
    ContainsUserData = "true"
    OWNER            = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_loader_assets_dev" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-loader-assets-dev"
  object_lock_enabled = false
  tags = {
    ContainsUserData = "true"
    OWNER            = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_misc" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-misc"
  object_lock_enabled = false
  tags = {
    ContainsUserData = "true"
    OWNER            = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_page_templates_thumbs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-page-templates-thumbs"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_prometheus_metrics" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-prometheus-metrics"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_ray" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-ray"
  object_lock_enabled = false
  tags = {
    OWNER = "yang"
  }

  bucket_key_enabled = false
  bucket_policy      = ""
  sse_algorithm      = "AES256"
  versioning         = "Enabled"
  mfa_delete         = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_s3_inventory" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-s3-inventory"
  object_lock_enabled = false
  bucket_key_enabled  = false
  bucket_policy       = ""
  sse_algorithm       = "AES256"
  versioning          = "Disabled"
  mfa_delete          = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enable_cors_conf      = false
  enabled_sse_conf      = false
}

module "plasmic_site_assets" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-site-assets"
  object_lock_enabled = false
  bucket_key_enabled  = false
  tags = {
    ContainsUserData = "true"
    OWNER            = "yang"
  }
  bucket_policy = ""
  sse_algorithm = "AES256"
  versioning    = "Enabled"
  mfa_delete    = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_static1" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-static1"
  object_lock_enabled = false
  bucket_key_enabled  = false
  tags = {
    OWNER = "yang"
  }
  bucket_policy = ""
  sse_algorithm = "AES256"
  versioning    = "Enabled"
  mfa_delete    = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_studio_logs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-studio-logs"
  object_lock_enabled = false
  bucket_key_enabled  = false
  tags = {
    OWNER = "yang"
  }
  bucket_policy = ""
  sse_algorithm = "AES256"
  versioning    = "Enabled"
  mfa_delete    = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_tracker1" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-tracker1"
  object_lock_enabled = false
  bucket_key_enabled  = false
  tags = {
    OWNER = "yang"
  }
  bucket_policy = ""
  sse_algorithm = "AES256"
  versioning    = "Enabled"
  mfa_delete    = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}

module "plasmic_trackter1_logs" {
  source              = "./modules/s3_bucket"
  bucket_name         = "plasmic-tracker1-logs"
  object_lock_enabled = false
  bucket_key_enabled  = false
  tags = {
    OWNER = "yang"
  }
  bucket_policy = ""
  sse_algorithm = "AES256"
  versioning    = "Enabled"
  mfa_delete    = "Disabled"
  grant = [
    {
      id          = "f3332a04d7c6c3cfee788237cf1ba2614a6b45a86b5d505b50f1ef50f9e4313e"
      permissions = "FULL_CONTROL"
      type        = "CanonicalUser"
    }
  ]
  owner                 = {}
  attach_policy         = ""
  enable_bucket_logging = false
  enable_lifecycle_conf = false
  enable_s3_bucket_acl  = false
  enabled_sse_conf      = false
  enable_cors_conf      = false
}
