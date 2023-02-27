module "jenkins_vpc_sg" {
  source      = "./modules/security_group"
  description = "Jenkins agent group for new VPC"
  ingress_info = [
    {
      cidr_blocks      = "10.10.78.91/32"
      description      = "gerrit"
      from_port        = "22"
      protocol         = "tcp"
      to_port          = "22"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      description      = ""
      security_groups  = "sg-0ce196e2e4ade153d"
      to_port          = "0"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    }
  ]
  vpc_id = module.base_vpc.vpc_id
  name   = "JenkinsVPC"
  tags = {
    Name        = "JenkinsVPC"
    Environment = "PROD"

  }
}

module "prod_db" {
  source      = "./modules/security_group"
  name        = "ProdDB"
  vpc_id      = "vpc-352d9f4d"
  description = "launch-wizard-1 created 2019-11-17T16:38:13.171-08:00"
  ingress_info = [{
    cidr_blocks      = "0.0.0.0/0"
    from_port        = "80"
    ipv6_cidr_blocks = "::/0"
    description      = ""
    protocol         = "tcp"
    to_port          = "80"
    security_groups  = ""

    },
    {
      cidr_blocks      = "172.31.42.190/32"
      description      = "gerrit"
      from_port        = "22"
      protocol         = "tcp"
      to_port          = "22"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      cidr_blocks      = "192.168.0.0/16"
      from_port        = "5432"
      protocol         = "tcp"
      description      = ""
      to_port          = "5432"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      cidr_blocks      = "44.227.132.119/32"
      description      = "Gerrit Instance"
      from_port        = "22"
      protocol         = "tcp"
      to_port          = "22"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      from_port        = "443"
      ipv6_cidr_blocks = "::/0"
      protocol         = "tcp"
      description      = ""
      to_port          = "443"
      security_groups  = ""
      cidr_blocks      = ""
    }
  ]
  tags = {
    Name        = "ProdDB"
    Environment = "PROD"
  }
}

module "production_server_sg" {
  source      = "./modules/security_group"
  description = "Production-server-sg"
  name        = "Production-server-sg"
  tags = {
    Environment = "PROD"
    Name        = "Production-server-sg"
  }
  ingress_info = [
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "DB to EKS cluster"
      from_port        = "5432"
      protocol         = "tcp"
      to_port          = "5432"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "Temporarily open to public to unblock deployment from jenkins"
      from_port        = "22"
      protocol         = "tcp"
      to_port          = "22"
      security_groups  = ""
      ipv6_cidr_blocks = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      from_port        = "443"
      ipv6_cidr_blocks = "::/0"
      protocol         = "tcp"
      to_port          = "443"
      description      = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      from_port        = "80"
      ipv6_cidr_blocks = "::/0"
      description      = ""
      protocol         = "tcp"
      to_port          = "80"
      security_groups  = ""
    },
    {
      description      = "Allow prometheus scraper from ec2 cluster"
      from_port        = "3004"
      protocol         = "tcp"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "3004"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""

    },
    {
      description      = "Postgres prometheus metrics exporter from eks-cluster"
      from_port        = "9187"
      protocol         = "tcp"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "9187"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    },
    {
      description      = "Postgres prometheus metrics exporter"
      from_port        = "9187"
      protocol         = "tcp"
      security_groups  = "sg-0ce196e2e4ade153d"
      to_port          = "9187"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    },
    {
      description      = "VPN"
      from_port        = "22"
      protocol         = "tcp"
      security_groups  = "sg-0ce196e2e4ade153d"
      to_port          = "22"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    },
    {
      from_port        = "22"
      protocol         = "tcp"
      security_groups  = "sg-0142467b1fe9f92bc"
      description      = ""
      to_port          = "22"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    },
    {
      from_port        = "22"
      protocol         = "tcp"
      security_groups  = "sg-085223d99e2dc5b89"
      description      = ""
      to_port          = "22"
      cidr_blocks      = ""
      ipv6_cidr_blocks = ""
    }
  ]

}

#module "base_infra_sg" {
#  source = "./modules/security_group"
#  name   = "base-infra-sg"
#  vpc_id = module.base_vpc.vpc_id
#  tags = {
#    Name = "default-sg-for-base-infra"
#  }
#  ingress_info = [
#
#  ]
#}

module "eks_cluster_sg" {
  source      = "./modules/security_group"
  vpc_id      = module.eks_cluster.eks_vpc_id
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  name        = "eks-cluster-sg-plasmic-cluster-762793850"
  tags = {
    Name                                    = "eks-cluster-sg-plasmic-cluster-762793850"
    "kubernetes.io/cluster/plasmic-cluster" = "owned"
  }
  ingress_info = [
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "kubernetes.io/rule/nlb/client=a3ed9b39c0fdf42e9a0175cfc7cd1c40"
      from_port        = "30101"
      protocol         = "tcp"
      to_port          = "30101"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "kubernetes.io/rule/nlb/client=a3ed9b39c0fdf42e9a0175cfc7cd1c40"
      from_port        = "30966"
      protocol         = "tcp"
      to_port          = "30966"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "kubernetes.io/rule/nlb/mtu"
      from_port        = "3"
      protocol         = "icmp"
      to_port          = "4"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "192.168.0.0/19"
      description      = "kubernetes.io/rule/nlb/health=a3ed9b39c0fdf42e9a0175cfc7cd1c40"
      from_port        = "31515"
      protocol         = "tcp"
      to_port          = "31515"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "192.168.32.0/19"
      description      = "kubernetes.io/rule/nlb/health=a3ed9b39c0fdf42e9a0175cfc7cd1c40"
      from_port        = "31515"
      protocol         = "tcp"
      to_port          = "31515"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "192.168.64.0/19"
      description      = "kubernetes.io/rule/nlb/health=a3ed9b39c0fdf42e9a0175cfc7cd1c40"
      from_port        = "31515"
      protocol         = "tcp"
      to_port          = "31515"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      description      = "Allow unmanaged nodes to communicate with control plane (all ports)"
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-01d4f9764b40f0996"
      cidr_blocks      = ""
      to_port          = "0"
      ipv6_cidr_blocks = ""
      security_groups  = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-001d5cf0445540681"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-0116bb6bb0807ad8f"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-03167ca1e2de4c297"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-002D-03912091d9e0c5a68"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-0d425b1fd110a3c0e"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-0d62428b7b3f66f25"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""

    }
  ]
}

module "comm_between_nodes_eks_sg" {
  source      = "./modules/security_group"
  vpc_id      = module.eks_cluster.eks_vpc_id
  name        = "eksctl-plasmic-cluster-cluster-ClusterSharedNodeSecurityGroup-1BRCEUU2HFF0D"
  description = "Communication between all nodes in the cluster"
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "plasmic-cluster"
    "alpha.eksctl.io/eksctl-version"              = "0.59.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "plasmic-cluster"
  }
  ingress_info = [
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-01d4f9764b40f0996"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""

  }]
}

module "eks_comm_between_cp_wrk_nodes_sg" {
  source      = "./modules/security_group"
  name        = "eksctl-plasmic-cluster-cluster-ControlPlaneSecurityGroup-7SEBPVAT8OHN"
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = module.eks_cluster.eks_vpc_id
  ingress_info = [{
    from_port        = "0"
    protocol         = "-1"
    security_groups  = ""
    to_port          = "0"
    ipv6_cidr_blocks = ""
    description      = ""
    cidr_blocks      = ""
  }]
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "plasmic-cluster"
    "alpha.eksctl.io/eksctl-version"              = "0.59.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "plasmic-cluster"
  }
}
module "eks_comm_nodegroup_internal_sg" {
  source      = "./modules/security_group"
  name        = ""
  vpc_id      = module.eks_cluster.eks_vpc_id
  description = "Allow SSH access"
  tags = {
    Name                                          = "eksctl-plasmic-cluster-nodegroup-internal-c6a-xlarge-eksctl-20220715T2301/SSH"
    "alpha.eksctl.io/cluster-name"                = "plasmic-cluster"
    "alpha.eksctl.io/eksctl-version"              = "0.101.0"
    "alpha.eksctl.io/nodegroup-name"              = "internal-c6a-xlarge-eksctl-20220715T2301"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "plasmic-cluster"
  }
  ingress_info = [
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = ""
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
  }]

}

module "gerrit_sg" {
  source      = "./modules/security_group"
  name        = "gerrit-security-group"
  description = "gerrit-security-group"
  vpc_id      = module.base_vpc.vpc_id
  tags = {
    Name = "gerrit-security-group"
  }
  ingress_info = [
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "Gerrit port to commit code."
      from_port        = "29418"
      protocol         = "tcp"
      to_port          = "29418"
      ipv6_cidr_blocks = ""
      description      = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      description      = "Postgres for Segment to connect to"
      from_port        = "5432"
      protocol         = "tcp"
      to_port          = "5432"
      ipv6_cidr_blocks = ""
      description      = ""
      security_groups  = ""
    },
    {
      cidr_blocks      = "0.0.0.0/0"
      from_port        = "443"
      protocol         = "tcp"
      to_port          = "443"
      ipv6_cidr_blocks = ""
      description      = ""
      security_groups  = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-019d9f6a5dd045a38"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    },
    {
      from_port        = "0"
      protocol         = "-1"
      security_groups  = "sg-0ce196e2e4ade153d"
      to_port          = "0"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    }
  ]
}

module "eks_kafka_sg" {
  source      = "./modules/security_group"
  name        = "k8s-to-kafka"
  description = "Kubernetes to kafka port 9092"
  vpc_id      = module.eks_cluster.eks_vpc_id
  tags = {
    Name = "k8s-to-kafka"
  }
  ingress_info = [
    {
      from_port        = "9090"
      protocol         = "tcp"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "9094"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
  }]
}

module "eks_postgres_sg" {
  source      = "./modules/security_group"
  name        = "k8s-to-postgres"
  description = "Created by RDS management console"
  vpc_id      = module.eks_cluster.eks_vpc_id
  tags        = {
    Name = "k8s-to-postgres"
  }
  ingress_info = [
    {
      from_port        = "5432"
      protocol         = "tcp"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "5432"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
  }]
}

module "eks_redis_sg" {
  source      = "./modules/security_group"
  name        = "k8s-to-redis"
  description = "Kubernetes to redis for posthog"
  vpc_id      = module.eks_cluster.eks_vpc_id
  tags        = {
    Name = "k8s-to-redis"
  }
  ingress_info = [
    {
      from_port        = "6379"
      protocol         = "tcp"
      security_groups  = "sg-0cde867c7c24fa933"
      to_port          = "6379"
      ipv6_cidr_blocks = ""
      description      = ""
      cidr_blocks      = ""
    }
  ]

}

