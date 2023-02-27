resource "aws_msk_cluster" "plasmic_posthog_kafka" {
  broker_node_group_info {
    az_distribution = "DEFAULT"
    client_subnets  = ["subnet-03ad014731df388be", "subnet-03fa140108853fa47", "subnet-0bb8bdc72990f52a3"]

    connectivity_info {
      public_access {
        type = "DISABLED"
      }
    }

    instance_type   = "kafka.t3.small"
    security_groups = ["sg-01dff4bc587d6d080", "sg-085e6fb3164c111dc"]

    storage_info {
      ebs_storage_info {
        provisioned_throughput {
          enabled           = "false"
        }

        volume_size = "40"
      }
    }
  }

  client_authentication {
    sasl {
      iam   = "false"
      scram = "false"
    }

    unauthenticated = "true"
    tls {}
  }

  cluster_name = "plasmic-posthog-kafka"

  configuration_info {
    arn      = "arn:aws:kafka:us-west-2:939375546786:configuration/PosthogMSKConfig/760eef82-fdf8-427a-9f24-d244b1d85308-7"
    revision = "1"
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = "arn:aws:kms:us-west-2:939375546786:key/8aae5e94-8879-4eed-b2ba-5168a65bf083"

    encryption_in_transit {
      client_broker = "PLAINTEXT"
      in_cluster    = "true"
    }
  }

  enhanced_monitoring = "DEFAULT"
  kafka_version       = "2.6.2"

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = "true"
        log_group = "kafka-debug-logs"
      }

      firehose {
        enabled = "false"
      }

      s3 {
        enabled = "false"
      }
    }
  }

  number_of_broker_nodes = "3"

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = "false"
      }

      node_exporter {
        enabled_in_broker = "false"
      }
    }
  }

}
