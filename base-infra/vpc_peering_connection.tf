resource "aws_vpc_peering_connection" "base_vpc_eks" {
  accepter {
    allow_remote_vpc_dns_resolution  = "false"
  }

  peer_owner_id = var.aws_account_id
  peer_region   = var.region
  peer_vpc_id   = module.eks_cluster.eks_vpc_id

  requester {
    allow_remote_vpc_dns_resolution  = "false"
  }

  tags = {
    Name = "base-vpc-eks-peering"
  }

  tags_all = {
    Name = "base-vpc-eks-peering"
  }

  vpc_id = module.base_vpc.vpc_id
}

resource "aws_vpc_peering_connection" "default_vpc_eks" {
  accepter {
    allow_remote_vpc_dns_resolution  = "false"
  }

  peer_owner_id = var.aws_account_id
  peer_region   = var.region
  peer_vpc_id   = "vpc-352d9f4d"

  requester {
    allow_remote_vpc_dns_resolution  = "false"
  }

  tags = {
    Name = "mainprod-plasmiccluster"
  }

  tags_all = {
    Name = "mainprod-plasmiccluster"
  }

  vpc_id = module.eks_cluster.eks_vpc_id
}
