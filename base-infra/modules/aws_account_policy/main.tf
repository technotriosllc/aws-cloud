resource "aws_iam_account_password_policy" "base_infra" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = var.password_reuse_prevention
  max_password_age               = var.max_password_age
}