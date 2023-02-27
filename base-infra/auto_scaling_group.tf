resource "aws_autoscaling_group" "eks_asg" {
#  availability_zones        = ["us-west-2b", "us-west-2a", "us-west-2c"]
  capacity_rebalance        = "true"
  default_cooldown          = "300"
  default_instance_warmup   = "0"
  desired_capacity          = "9"
  force_delete              = "false"
  health_check_grace_period = "15"
  health_check_type         = "EC2"
  max_instance_lifetime     = "0"
  max_size                  = "10"
  metrics_granularity       = "1Minute"
  min_size                  = "2"

  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = "0"
      on_demand_percentage_above_base_capacity = "100"
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = "2"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0278553a0d38c787d"
        launch_template_name = "eks-28c0ff7a-4365-3385-eebf-0ba033a8d425"
        version              = "1"
      }

      override {
        instance_type = "c6a.xlarge"
      }
    }
  }

  name                    = "eks-internal-c6a-xlarge-eksctl-20220715T2301-28c0ff7a-4365-3385-eebf-0ba033a8d425"
  protect_from_scale_in   = "false"
  service_linked_role_arn = "arn:aws:iam::939375546786:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  tag {
    key                 = "kubernetes.io/cluster/plasmic-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  tag {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = "true"
    value               = "internal-c6a-xlarge-eksctl-20220715T2301"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/plasmic-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = "true"
    value               = "true"
  }

  tag {
    key                 = "Owner"
    propagate_at_launch = "true"
    value               = "Yang"
  }

  tag {
    key                 = "eks:cluster-name"
    propagate_at_launch = "true"
    value               = "plasmic-cluster"
  }

  termination_policies      = ["AllocationStrategy", "OldestLaunchTemplate", "OldestInstance"]
  vpc_zone_identifier       = ["subnet-0c84955fe3c285dc1", "subnet-05b490f98e6f39c00", "subnet-08f6d0ab31cf297bc"]
  wait_for_capacity_timeout = "10m"
}
