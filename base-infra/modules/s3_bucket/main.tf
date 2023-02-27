data "aws_canonical_user_id" "this" {}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket              = var.bucket_name
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
  tags_all            = var.tags
}

resource "aws_s3_bucket_cors_configuration" "main" {
  count = var.enable_cors_conf == true ? 1 : 0
  bucket = aws_s3_bucket.main.id
  cors_rule {
    allowed_methods = []
    allowed_origins = []
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  count = var.enable_lifecycle_conf == true ? 1 : 0
  bucket = aws_s3_bucket.main.id
  rule {
    id     = "Auto delete old backups"
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  count = var.enabled_sse_conf == true ? 1 : 0
  bucket = aws_s3_bucket.main.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
    bucket_key_enabled = var.bucket_key_enabled
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status     = var.versioning
    mfa_delete = var.mfa_delete
  }
}

resource "aws_s3_bucket_logging" "s3_logging" {
  count         = var.enable_bucket_logging == true ? 1 : 0
  bucket        = aws_s3_bucket.main.id
  target_bucket = "plasmic-bucket-logging-xtms"
  target_prefix = "bucketLogs/"
}

resource "aws_s3_bucket_acl" "main_acl" {
  count = var.enable_s3_bucket_acl == true ? 1 : 0
  bucket = aws_s3_bucket.main.id
  dynamic "access_control_policy" {
    for_each = length(var.grant) > 0 ? [true] : []
    content {
      dynamic "grant" {
        for_each = var.grant
        content {
          permission = grant.value.permissions
          grantee {
            type          = grant.value.type
            id            = try(grant.value.id, null)
            uri           = try(grant.value.uri, null)
            email_address = try(grant.value.email, null)
          }
        }
      }
      owner {
        id           = try(var.owner["id"], data.aws_canonical_user_id.this.id)
        display_name = try(var.owner["display_name"], null)
      }
    }
  }
}

resource "aws_s3_bucket_policy" "main_policy" {
  count  = var.attach_policy != "" ? 1 : 0
  bucket = aws_s3_bucket.main.id
  policy = var.bucket_policy
}