resource "aws_db_instance" "posthog_postgres" {
  allocated_storage                     = "32"
  auto_minor_version_upgrade            = "true"
  availability_zone                     = "us-west-2a"
  backup_retention_period               = "7"
  backup_window                         = "22:00-22:30"
  ca_cert_identifier                    = "rds-ca-2019"
  copy_tags_to_snapshot                 = "true"
  customer_owned_ip_enabled             = "false"
  db_subnet_group_name                  = "default-vpc-00062c093a243b9dc"
  deletion_protection                   = "true"
  engine                                = "postgres"
  engine_version                        = "13.7"
  iam_database_authentication_enabled   = "false"
  identifier                            = "posthog-postgres"
  instance_class                        = "db.t4g.small"
  iops                                  = "0"
  kms_key_id                            = "arn:aws:kms:us-west-2:939375546786:key/901a6727-19f7-425b-bafe-fb447327289e"
  license_model                         = "postgresql-license"
  maintenance_window                    = "sat:21:00-sat:21:30"
  max_allocated_storage                 = "64"
  monitoring_interval                   = "0"
  multi_az                              = "false"
  network_type                          = "IPV4"
  option_group_name                     = "default:postgres-13"
  parameter_group_name                  = "default.postgres13"
  performance_insights_enabled          = "true"
  performance_insights_kms_key_id       = "arn:aws:kms:us-west-2:939375546786:key/901a6727-19f7-425b-bafe-fb447327289e"
  performance_insights_retention_period = "7"
  port                                  = "5432"
  publicly_accessible                   = "false"
  storage_encrypted                     = "true"
#  storage_throughput                    = "0"
  storage_type                          = "gp2"

  tags = {
    Owner   = "Yang"
    Project = "posthog"
  }

  tags_all = {
    Owner   = "Yang"
    Project = "posthog"
  }

  username               = "postgres"
  vpc_security_group_ids = ["sg-085e6fb3164c111dc", "sg-09f860c207feef985"]
}

resource "aws_db_subnet_group" "default_vpc_sg_db" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-00062c093a243b9dc"
  subnet_ids  = ["subnet-03fa140108853fa47", "subnet-08f6d0ab31cf297bc", "subnet-0bb8bdc72990f52a3", "subnet-03ad014731df388be", "subnet-0c84955fe3c285dc1", "subnet-05b490f98e6f39c00"]
}

