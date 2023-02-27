locals {
  instance_details = [
    {
      instance_name               = "wireguard-vpn"
      env                         = "production"
      owner                       = "aman"
      managed_by                  = "Managed by Terraform"
      key_name                    = "vpnserver"
      instance_type               = "t2.medium"
      ami_id                      = "ami-017fecd1353bcc96e"
      public_ip_enabled           = false
      enable_eip                  = true
      user_data_enabled           = true
      security_group_id           = "sg-0ce196e2e4ade153d"
      volume_size                 = 30
      volume_type                 = "gp2"
      delete_on_termination       = true
      user_data_replace_on_change = true
      user_data_base64            = "6be5c0f75abd79659ee0699a848f8e5fc3c94476"
      delete_on_termination       = true
      user_data_enabled           = true
      subnet_id                   = "subnet-0f0769ca1d13d4457" #module.base_vpc.public_subnets[0]
      az                          = "us-west-2a"
      iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"
      ebs_optimized               = false


    },
    {
      instance_name               = "discourse-server"
      env                         = "production"
      owner                       = "Yang"
      key_name                    = "plasmic-root2"
      instance_type               = "t3a.small"
      ami_id                      = "ami-0fa0f4982be6a6db8" # Please take snapshot of latest running instance volume and create AMI and update it here.
      enable_eip                  = true
      user_data_enabled           = true
      security_group_id           = "sg-019d9f6a5dd045a38"
      volume_size                 = 50
      volume_type                 = "gp2"
      delete_on_termination       = true
      user_data_replace_on_change = true
      user_data_base64            = ""
      delete_on_termination       = true
      user_data_enabled           = true
      subnet_id                   = "" # module.base_vpc.public_subnets[0]
      az                          = "us-west-2b"
      iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"
      ebs_optimized               = true

    },
    {
      instance_name               = "gerrit-server"
      env                         = "production"
      owner                       = "Yang"
      key_name                    = "plasmic-root2"
      instance_type               = "m5a.xlarge"
      ami_id                      = "ami-0e8c9aeef50d12cde" # Please take snapshot of latest running instance volume and create AMI and update it here.
      enable_eip                  = true
      user_data_enabled           = true
      security_group_id           = "sg-085223d99e2dc5b89"
      volume_size                 = 512
      volume_type                 = "gp2"
      delete_on_termination       = true
      user_data_replace_on_change = true
      user_data_base64            = ""
      delete_on_termination       = true
      user_data_enabled           = true
      subnet_id                   = "subnet-081840e79c335a79a" # module.base_vpc.public_subnets[0]
      az                          = "us-west-2b"
      iam_instance_profile        = "InternalDevops"
      ebs_optimized               = true
    },
    {
      instance_name               = "production-server"
      env                         = "production"
      owner                       = "Yang"
      key_name                    = "plasmic-root2"
      instance_type               = "m5a.xlarge"
      ami_id                      = "ami-0f1888aafe303afea" # Please take snapshot of latest running instance volume and create AMI and update it here.
      enable_eip                  = true
      user_data_enabled           = true
      security_group_id           = "sg-0d80a04d8b9b140bf"
      volume_size                 = 1512
      volume_type                 = "gp2"
      delete_on_termination       = true
      user_data_replace_on_change = true
      user_data_base64            = ""
      delete_on_termination       = true
      user_data_enabled           = true
      subnet_id                   = "" #module.base_vpc.public_subnets[0]
      az                          = "us-west-2b"
      iam_instance_profile        = "CloudWatchAgentServerRole"
      ebs_optimized               = true
      #iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
    }
  ]
}

