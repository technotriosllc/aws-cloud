resource "aws_cloudwatch_log_group" "container_insight_performance_lg" {
  name = "/aws/containerinsights/plasmic-cluster/performance"
}

resource "aws_cloudwatch_log_group" "plasmic_cluster_lg" {
  name = "/aws/eks/plasmic-cluster/cluster"
}

resource "aws_cloudwatch_log_group" "kafka_logs_lg" {
  name              = "kafka-debug-logs"
  retention_in_days = "365"
}
