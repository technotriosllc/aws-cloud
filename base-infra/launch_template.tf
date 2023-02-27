resource "aws_launch_template" "eks_lt_425" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      iops        = "3000"
      throughput  = "125"
      volume_size = "80"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    name = "eks-28c0ff7a-4365-3385-eebf-0ba033a8d425"
  }

  image_id = "ami-00cf63b12c53803a5"
  key_name = "plasmic-root2"

  metadata_options {
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }

  name = "eks-28c0ff7a-4365-3385-eebf-0ba033a8d425"

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name                             = "plasmic-cluster-internal-c6a-xlarge-eksctl-20220715T2301-Node"
      "alpha.eksctl.io/nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "plasmic-cluster"
      "eks:nodegroup-name"             = "internal-c6a-xlarge-eksctl-20220715T2301"
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name                             = "plasmic-cluster-internal-c6a-xlarge-eksctl-20220715T2301-Node"
      "alpha.eksctl.io/nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "plasmic-cluster"
      "eks:nodegroup-name"             = "internal-c6a-xlarge-eksctl-20220715T2301"
    }
  }

  tags = {
    "eks:cluster-name"   = "plasmic-cluster"
    "eks:nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
  }

  tags_all = {
    "eks:cluster-name"   = "plasmic-cluster"
    "eks:nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
  }

  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU0xZWtORFFXTXJaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVFMUVaM2ROVkVFd1RsUnJNRTFXYjFoRVZFMTRUVVJqZWsxRVFUQk9WR3N3VFZadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJUR2RRQ2xOd2VXOU9ibXhzYUZCYU1GTjBjMWhyVkU5NmJYSkZWVGN5VjFWWmFEUlFiak5IUzJNeGREZGFVMVpRTDNKaWFHczRjSHB4V2tneFdtZHpTamhtWW5ZS1ZtUnFUbWRIWWk5bVdFeGFNbk5HVjFkR2RtVkJkMjQxVkVsdVdXSldORWR1TmxoTE1ESlBNV3RxVmxCVWJHWmFUekZVV1hwdGVqZ3JTVFZzZGpGUmNBb3pZVlZHSzNkR1kxTXJjVXR0UWxkbmRHdFdORlY1ZUVkeWNtMUtjbTFCY1hVeFZXWk5lVk01YlRWTFF6aEdaMk5SVldnelNHUkxaR0pVV2tOWGVrcFZDbkpsVDJsQ2VIWXhXR3hVV1ZCVVlpOXBSMlphZVdGMVlpOU5OM2N3YTNvMWRtNUdMekJKTDFFeVNsUlJPWEFyV0RKT1pXeFhiV2d4ZW5Rck0wVTNORmdLTDFrNFoyOVlhRnBtUzFWWFRWSmpkbGhJVHpOVVNtdFpSWE42ZUhaVlJHNW9XVk41TW5sTWFraG5XVVV2UTNORVIycEpXRk40VEZCYVlYRlBRMHA2VGdwS056bDZka1IwVGpoNkt6UndUekZyY0hCRlEwRjNSVUZCWVU1RFRVVkJkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaR1puUklVRkZVY1dWcGNHRXZWbk42V2xodWVsRkhMMVpXTlV4TlFUQkhRMU54UjFOSllqTUtSRkZGUWtOM1ZVRkJORWxDUVZGQmR6QlFlamsyYUVJM1MzUTRhRXhYWlVaeVdsUlViSEZNT0ZsMGRHUTVObTh2WjFSTWNVVnlUa00xVjJWRFJuSldXQXBuV0hoUlltb3dRMlp6YUhBcllVaHhNSFpyWlRoRkwwTkViVkY2T0ZkU2FFOHJlbTl5TWtoV1RtWmtaamRsUm1oNFpqaFRRalZOYlU5NE5HaDRSbmxSQ21wRGFYWlRNV2t6VURGQk4wZDBaRE5tVTNCb1YwRmpaVTF2VDFSWmVTdFNUbGRyUkRCcGNXMHdUalZ4TDJ0SGJIVXhWM2xHVTBFeFZHZFRjWHB6YjBjS2IyVjBaalpJZFZBNFQzaFFWbm9yTkhVeVNUTmFUR1Y1VVhKMlRVeHRXbFZIVVZaNFN6UjRUVWRLZEdKV1JuVktRazFtUzA5blZFRXdOMlpDZW1rM05nbzJPVEkwWTB0Wk1HZGhURFIxUmtka1MxQmlVMW94TlRsaFpXMWlkMnBQWWpsMFJuSmllVTVJVVRGMVdYcGlkbVZWU3pkbFVtMXFZa2hWVEcwelQwOXVDbE53WTA1dVJ6aGxTMWN3TTBGWE5YQlVWWEp3TnpJMlp6VXhjRmx1YnpJd2R6WkpWUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09CkFQSV9TRVJWRVJfVVJMPWh0dHBzOi8vQzE4N0FERkQ0NjFEN0QwQjEwRjZENTMwODVFRUQ1QkQuZ3I3LnVzLXdlc3QtMi5la3MuYW1hem9uYXdzLmNvbQpLOFNfQ0xVU1RFUl9ETlNfSVA9MTAuMTAwLjAuMTAKL2V0Yy9la3MvYm9vdHN0cmFwLnNoIHBsYXNtaWMtY2x1c3RlciAtLWt1YmVsZXQtZXh0cmEtYXJncyAnLS1ub2RlLWxhYmVscz1la3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZVZlcnNpb249MSxhbHBoYS5la3NjdGwuaW8vbm9kZWdyb3VwLW5hbWU9aW50ZXJuYWwtYzZhLXhsYXJnZS1la3NjdGwtMjAyMjA3MTVUMjMwMSxhbHBoYS5la3NjdGwuaW8vY2x1c3Rlci1uYW1lPXBsYXNtaWMtY2x1c3Rlcixla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXAtaW1hZ2U9YW1pLTAwY2Y2M2IxMmM1MzgwM2E1LGVrcy5hbWF6b25hd3MuY29tL2NhcGFjaXR5VHlwZT1PTl9ERU1BTkQsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwPWludGVybmFsLWM2YS14bGFyZ2UtZWtzY3RsLTIwMjIwNzE1VDIzMDEsZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVJZD1sdC0wOTEzMmE4N2UyODYwMmQ0OScgLS1iNjQtY2x1c3Rlci1jYSAkQjY0X0NMVVNURVJfQ0EgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJEFQSV9TRVJWRVJfVVJMIC0tZG5zLWNsdXN0ZXItaXAgJEs4U19DTFVTVEVSX0ROU19JUAoKLS0vLy0t"
  vpc_security_group_ids = ["sg-006d9577e7441ee06", "sg-0cde867c7c24fa933"]
}

resource "aws_launch_template" "eks_lt_301" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      iops        = "3000"
      throughput  = "125"
      volume_size = "80"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"
  key_name                = "plasmic-root2"

  metadata_options {
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }

  name = "eksctl-plasmic-cluster-nodegroup-internal-c6a-xlarge-eksctl-20220715T2301"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name                             = "plasmic-cluster-internal-c6a-xlarge-eksctl-20220715T2301-Node"
      "alpha.eksctl.io/nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name                             = "plasmic-cluster-internal-c6a-xlarge-eksctl-20220715T2301-Node"
      "alpha.eksctl.io/nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name                             = "plasmic-cluster-internal-c6a-xlarge-eksctl-20220715T2301-Node"
      "alpha.eksctl.io/nodegroup-name" = "internal-c6a-xlarge-eksctl-20220715T2301"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  vpc_security_group_ids = ["sg-0cde867c7c24fa933", "sg-006d9577e7441ee06"]
}
