resource "random_string" "random_vpc" {
  special = false
  length  = 4
}

resource "aws_vpc" "plasmic_cluster_vpc" {
  cidr_block = var.vpc_cidr
  tags_all = tomap({
    "Name"                                        = "eksctl-plasmic-cluster-cluster/VPC",
    "alpha.eksctl.io/cluster-name"                = "plasmic-cluster",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "plasmic-cluster"

  })
  tags = tomap({
    "Name"                                        = "eksctl-plasmic-cluster-cluster/VPC",
    "alpha.eksctl.io/cluster-name"                = "plasmic-cluster",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "plasmic-cluster"

  })
}

resource "aws_subnet" "cluster_subnet_public" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.plasmic_cluster_vpc.id
  cidr_block              = element(var.public_subnet, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.az, count.index)

  tags = tomap({
    "Name"                                        = "eksctl-plasmic-cluster-cluster/SubnetPublic${upper(element(var.az, count.index))}",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "kubernetes.io/role/elb"                      = 1,
    "alpha.eksctl.io/cluster-name"                = var.cluster_name
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  })
}

resource "aws_subnet" "cluster_subnet_private" {
  count             = length(var.az)
  vpc_id            = aws_vpc.plasmic_cluster_vpc.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = element(var.az, count.index)
  tags = tomap({
    "Name"                                        = "eksctl-plasmic-cluster-cluster/SubnetPrivate${upper(element(var.az, count.index))}",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "kubernetes.io/role/internal-elb"             = 1,
    "alpha.eksctl.io/cluster-name"                = var.cluster_name
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  })
}


resource "aws_internet_gateway" "vpc_internet_gateway" {
  vpc_id = aws_vpc.plasmic_cluster_vpc.id
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/InternetGateway",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "kubernetes.io/role/internal-elb"             = 1,
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}

resource "aws_eip" "plasmic_cluster_eip" {
  vpc = true
}

resource "aws_nat_gateway" "plasmic_cluster_nat_gwy" {
  subnet_id     = aws_subnet.cluster_subnet_public[2].id
  allocation_id = aws_eip.plasmic_cluster_eip.id
  tags = {
    Name                                          = " eksctl-plasmic-cluster-cluster/NATGateway",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}
resource "aws_route_table" "public_vpc_route_table" {
  vpc_id = aws_vpc.plasmic_cluster_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_internet_gateway.id
  }
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/PublicRouteTable",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}

resource "aws_route_table" "private_route_a_table" {
  vpc_id = aws_vpc.plasmic_cluster_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.plasmic_cluster_nat_gwy.id
  }
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/PrivateRouteTableUSWEST2A",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}

resource "aws_route_table" "private_route_b_table" {
  vpc_id = aws_vpc.plasmic_cluster_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.plasmic_cluster_nat_gwy.id
  }
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/PrivateRouteTableUSWEST2B",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}

resource "aws_route_table" "private_route_c_table" {
  vpc_id = aws_vpc.plasmic_cluster_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.plasmic_cluster_nat_gwy.id
  }
  tags = {
    Name                                          = "eksctl-plasmic-cluster-cluster/PrivateRouteTableUSWEST2C",
    "alpha.eksctl.io/eksctl-version"              = "0.59.0",
    "alpha.eksctl.io/cluster-name"                = var.cluster_name,
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.cluster_name
  }
}
resource "aws_route_table_association" "public_vpc_route_table_association" {
  count          = length(var.public_subnet)
  route_table_id = aws_route_table.public_vpc_route_table.id
  subnet_id      = element(aws_subnet.cluster_subnet_public.*.id, count.index)
}

resource "aws_route_table_association" "private_vpc_a_route_table_association" {
  route_table_id = aws_route_table.private_route_a_table.id
  subnet_id      = aws_subnet.cluster_subnet_private.0.id
}

resource "aws_route_table_association" "private_vpc_b_route_table_association" {
  route_table_id = aws_route_table.private_route_b_table.id
  subnet_id      = aws_subnet.cluster_subnet_private.1.id
}

resource "aws_route_table_association" "private_vpc_c_route_table_association" {
  route_table_id = aws_route_table.private_route_c_table.id
  subnet_id      = aws_subnet.cluster_subnet_private.2.id
}

data "aws_s3_bucket" "log_bucket" {
  bucket = "plasmic-vpc-flowlogs"
}

resource "aws_flow_log" "eks_infra_flow_logs" {
  traffic_type         = "ALL"
  log_destination      = data.aws_s3_bucket.log_bucket.arn
  log_destination_type = "s3"
  vpc_id               = aws_vpc.plasmic_cluster_vpc.id
}



