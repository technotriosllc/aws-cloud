module "rds_memory_alarm" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "RDS Instance Freeable memory is less than 200MB"
  alarm_name          = "RDS Instance Freeable memory is less than 200MB"
  comparison_operator = "LessThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  evaluation_periods  = "1"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = "200000000"
  treat_missing_data  = "missing"
}

module "unhealthy_host_count_afd5b7ee577154d7793aeca945ed96c6" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = true
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Unhealthy Host Count is greater than 0 on afd5b7ee577154d7793aeca945ed96c6"
  alarm_name          = "Unhealthy Host Count is greater than 0 on afd5b7ee577154d7793aeca945ed96c6"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = 1
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2b"
    LoadBalancerName = "afd5b7ee577154d7793aeca945ed96c6"
  }
  evaluation_periods = 1
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "0"
  treat_missing_data = "missing"
}

module "unhealthy_host_count_a49a6081b1f1142c9ba6556fed797d47" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = true
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Unhealthy Host count is greater than 0 on a49a6081b1f1142c9ba6556fed797d47"
  alarm_name          = "Unhealthy Host count is greater than 0 on a49a6081b1f1142c9ba6556fed797d47"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = 1
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2a"
    LoadBalancerName = "a49a6081b1f1142c9ba6556fed797d47"
  }
  evaluation_periods = 1
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "0"
  treat_missing_data = "missing"
}

module "unhealthy_host_count_a846b4e416ff04bfc9a27a1ba51a5710" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = true
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Unhealthy Host count is greater than 0 on a846b4e416ff04bfc9a27a1ba51a5710"
  alarm_name          = "Unhealthy Host count is greater than 0 on a846b4e416ff04bfc9a27a1ba51a5710"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = 1
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a846b4e416ff04bfc9a27a1ba51a5710"
  }
  evaluation_periods = 1
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "0"
  treat_missing_data = "missing"
}

module "unhealthy_host_count_a7beb6a7cc2334ba68cb405d4a487144" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Unhealthy host count is greater than 0 on a7beb6a7cc2334ba68cb405d4a487144"
  alarm_name          = "Unhealthy host count is greater than 0 on a7beb6a7cc2334ba68cb405d4a487144"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a7beb6a7cc2334ba68cb405d4a487144"
  }

  evaluation_periods = "1"
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "0"
  treat_missing_data = "missing"
}

module "unhealthy_host_count_a7d1793684064461fb95f2d0f78651d1" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_name          = "Unhealthy host count is greater than 0 a7d1793684064461fb95f2d0f78651d1"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a7d1793684064461fb95f2d0f78651d1"
  }

  evaluation_periods = "1"
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "100"
  treat_missing_data = "missing"
  alarm_description  = "Unhealthy host count is greater than 0 a7d1793684064461fb95f2d0f78651d1"
}

module "unhealthy_host_count_a0c446de22b2c4535ba7af77345fae10" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "unhealthy Host count is greater than 0 on a0c446de22b2c4535ba7af77345fae10"
  alarm_name          = "unhealthy Host count is greater than 0 on a0c446de22b2c4535ba7af77345fae10"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a0c446de22b2c4535ba7af77345fae10"
  }

  evaluation_periods = "1"
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "0"
  treat_missing_data = "missing"
}

module "prod_disk_alarm" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_name          = "Production Server disk full"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  alarm_description   = "Production Server disk full"
  dimensions_enabled  = true
  dimensions = {
    ImageId      = "ami-0f1888aafe303afea"
    InstanceId   = "i-0b72cc317b56cfbda"
    InstanceType = "m5a.xlarge"
    device       = "nvme0n1p1"
    fstype       = "ext4"
    path         = "/"
  }

  evaluation_periods = "1"
  metric_name        = "disk_used_percent"
  namespace          = "CWAgent"
  period             = "300"
  statistic          = "Average"
  threshold          = "94"
  treat_missing_data = "missing"
}

module "prod_cpu_alarm" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_name          = "Memory utilization is high on Production Server"
  alarm_description   = "Memory utilization is high on Production Server"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    ImageId      = "ami-0f1888aafe303afea"
    InstanceId   = "i-0b72cc317b56cfbda"
    InstanceType = "m5a.xlarge"
  }

  evaluation_periods = "1"
  metric_name        = "mem_used_percent"
  namespace          = "CWAgent"
  period             = "300"
  statistic          = "Average"
  threshold          = "90"
  treat_missing_data = "missing"
}

module "latency_alarm_afd5b7ee577154d7793aeca945ed96c6" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is high on img-origin.plasmic.app (afd5b7ee577154d7793aeca945ed96c6)"
  alarm_name          = "Latency is high on afd5b7ee577154d7793aeca945ed96c6"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2c"
    LoadBalancerName = "afd5b7ee577154d7793aeca945ed96c6"
  }

  evaluation_periods = "1"
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "10"
  treat_missing_data = "missing"
}

module "latency_alarm_a846b4e416ff04bfc9a27a1ba51a5710" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is high on a846b4e416ff04bfc9a27a1ba51a5710 (codegen-origin.plasmic.app)"
  alarm_name          = "Latency is high on a846b4e416ff04bfc9a27a1ba51a5710"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2c"
    LoadBalancerName = "a846b4e416ff04bfc9a27a1ba51a5710"
  }

  evaluation_periods = "1"
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "120"
  treat_missing_data = "missing"
}

module "latency_alarm_a7d1793684064461fb95f2d0f78651d1" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is high on a7d1793684064461fb95f2d0f78651d1"
  alarm_name          = "Latency is high on a7d1793684064461fb95f2d0f78651d1"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2c"
    LoadBalancerName = "a7d1793684064461fb95f2d0f78651d1"
  }

  evaluation_periods = "1"
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

module "latency_alarm_a7beb6a7cc2334ba68cb405d4a487144" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is high on a7beb6a7cc2334ba68cb405d4a487144"
  alarm_name          = "Latency is high on a7beb6a7cc2334ba68cb405d4a487144"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a7beb6a7cc2334ba68cb405d4a487144"
  }

  evaluation_periods = "1"
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

module "latency_alarm_a49a6081b1f1142c9ba6556fed797d47" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = true
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is High on a49a6081b1f1142c9ba6556fed797d47"
  alarm_name          = "Latency is High on a49a6081b1f1142c9ba6556fed797d47"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = 1
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2b"
    LoadBalancerName = "a49a6081b1f1142c9ba6556fed797d47"
  }

  evaluation_periods = 1
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

module "latency_alarm_a0c446de22b2c4535ba7af77345fae10" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "Latency is high on a0c446de22b2c4535ba7af77345fae10"
  alarm_name          = "Latency is high on a0c446de22b2c4535ba7af77345fae10"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    LoadBalancerName = "a0c446de22b2c4535ba7af77345fae10"
  }

  evaluation_periods = "1"
  metric_name        = "Latency"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

module "http_error_lb_a846b4e416ff04bfc9a27a1ba51a5710" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "HTTPCode_ELB_5XX high on a846b4e416ff04bfc9a27a1ba51a5710"
  alarm_name          = "HTTPCode_ELB_5XX high on a846b4e416ff04bfc9a27a1ba51a5710"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2a"
    LoadBalancerName = "a846b4e416ff04bfc9a27a1ba51a5710"
  }

  evaluation_periods = "1"
  metric_name        = "HTTPCode_ELB_5XX"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "2"
  treat_missing_data = "missing"
}

module "http_error_lb_a7d1793684064461fb95f2d0f78651d1" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "HTTPCode_ELB_5XX high on a7d1793684064461fb95f2d0f78651d1"
  alarm_name          = "HTTPCode_ELB_5XX high on a7d1793684064461fb95f2d0f78651d1"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2c"
    LoadBalancerName = "a7d1793684064461fb95f2d0f78651d1"
  }

  evaluation_periods = "1"
  metric_name        = "HTTPCode_ELB_5XX"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "2"
  treat_missing_data = "missing"
}

module "http_error_lb_afd5b7ee577154d7793aeca945ed96c6" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "HTTPCode_ELB_5XX High on afd5b7ee577154d7793aeca945ed96c6"
  alarm_name          = "HTTPCode_ELB_5XX High on afd5b7ee577154d7793aeca945ed96c6"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    AvailabilityZone = "us-west-2c"
    LoadBalancerName = "afd5b7ee577154d7793aeca945ed96c6"
  }

  evaluation_periods = "1"
  metric_name        = "HTTPCode_ELB_5XX"
  namespace          = "AWS/ELB"
  period             = "300"
  statistic          = "Average"
  threshold          = "2"
  treat_missing_data = "missing"
}

module "free_storage_db_instance" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "FreeStorageSpace is less than 3G on database instance"
  alarm_name          = "FreeStorageSpace is less than 3G on database instance"
  comparison_operator = "LessThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    DBInstanceIdentifier = "posthog-postgres"
  }

  evaluation_periods = "1"
  metric_name        = "FreeStorageSpace"
  namespace          = "AWS/RDS"
  period             = "300"
  statistic          = "Average"
  threshold          = "3000000000"
  treat_missing_data = "missing"
}

module "disk_queue_depth_alarm_db" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "DiskQueueDepth is high on db : posthog-postgres"
  alarm_name          = "DiskQueueDepth is high on db : posthog-postgres"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "1"
  dimensions_enabled  = true
  dimensions = {
    DBInstanceIdentifier = "posthog-postgres"
  }

  evaluation_periods = "1"
  metric_name        = "DiskQueueDepth"
  namespace          = "AWS/RDS"
  period             = "300"
  statistic          = "Average"
  threshold          = "1"
  treat_missing_data = "missing"
}

module "cpu_utilization_db" {
  source              = "./modules/cloudwatch_alarms"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:us-west-2:939375546786:Prod_Disk_Full"]
  alarm_description   = "CPU Utilization High on RDS posthog-postgres"
  alarm_name          = "CPU Utilization High on RDS posthog-postgres"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm = "1"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  treat_missing_data  = "missing"
}

