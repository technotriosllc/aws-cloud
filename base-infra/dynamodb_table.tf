resource "aws_dynamodb_table" "tfstate_lock_table_dydb" {
  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  name         = "plasmic-tfstate-lock-table"

  point_in_time_recovery {
    enabled = "true"
  }

  read_capacity  = "0"
  stream_enabled = "false"
  write_capacity = "0"
}
