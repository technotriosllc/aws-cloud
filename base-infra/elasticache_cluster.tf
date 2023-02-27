#resource "aws_elasticache_cluster" "posthog_redis_cluster" {
#  auto_minor_version_upgrade = "true"
#  availability_zone          = "us-west-2a"
#  cluster_id                 = "posthog-redis2"
##  ip_discovery               = "ipv4"
##  network_type               = "ipv4"
#  replication_group_id       = aws_elasticache_replication_group.posthog_redis_cluster_replication.replication_group_id
#}

resource "aws_elasticache_replication_group" "posthog_redis_cluster_replication" {
  at_rest_encryption_enabled = "true"
  auto_minor_version_upgrade = "true"
  automatic_failover_enabled = "true"
  data_tiering_enabled       = "false"
  description                = " "
  engine                     = "redis"
  engine_version             = "6.2"
  maintenance_window         = "sun:21:00-sun:22:00"
  multi_az_enabled           = "false"
  node_type                  = "cache.t4g.small"
  parameter_group_name       = "default.redis6.x"
  port                       = "6379"
  replication_group_id       = "posthog-redis2"
  security_group_ids         = ["sg-085e6fb3164c111dc", "sg-022d6e9aa1e6a7d29"]
  snapshot_retention_limit   = "7"
  snapshot_window            = "20:00-21:00"
  subnet_group_name          = aws_elasticache_subnet_group.posthog_redis_cluster_subnet_grp.name
  transit_encryption_enabled = "false"
}

resource "aws_elasticache_subnet_group" "posthog_redis_cluster_subnet_grp" {
  description = " "
  name        = "plasmic-posthog-redis"
  subnet_ids  = ["subnet-03fa140108853fa47", "subnet-08f6d0ab31cf297bc"]
}
