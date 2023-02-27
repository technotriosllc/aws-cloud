resource "random_string" "random_vpc" {
  special = false
  length  = 4
}

locals {
  vpc_tag = "${var.vpc_name}-${random_string.random_vpc.id}"
}
resource "aws_vpc" "plasmic_base" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = tomap({
    "Name" = local.vpc_tag
  })
}



resource "aws_subnet" "base_subnet_public" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.plasmic_base.id
  cidr_block              = element(var.public_subnet, count.index)
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = false

  tags = tomap({
    "Name" = "${local.vpc_tag}-${element(var.az, count.index)}-public"
  })
}

resource "aws_subnet" "base_subnet_private" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.plasmic_base.id
  cidr_block              = element(var.private_subnet, count.index)
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = false
  tags = tomap({
    "Name" = "${local.vpc_tag}-${element(var.az, count.index)}-private"
  })
}


resource "aws_internet_gateway" "base_ig" {
  vpc_id = aws_vpc.plasmic_base.id
  tags = {
    "Name"        = "${local.vpc_tag}-ig",
    "Environment" = "base-infra"
  }
}

resource "aws_eip" "nat_gateway_eip" {
  vpc = true
  tags = {
    "Name" = "nat-gateway-base-vpc"
  }
}

resource "aws_nat_gateway" "base_nat" {
  subnet_id     = aws_subnet.base_subnet_public[1].id
  allocation_id = aws_eip.nat_gateway_eip.id
  tags = {
    Name = "${local.vpc_tag}-nat-gtw"
  }
}
resource "aws_route_table" "base_route_table_public" {
  vpc_id = aws_vpc.plasmic_base.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.base_ig.id
  }
  tags = {
    Name = "${local.vpc_tag}-public-route"
  }
}

resource "aws_route_table_association" "vpc_route_table_public_association" {
  count          = length(var.public_subnet)
  route_table_id = aws_route_table.base_route_table_public.id
  subnet_id      = element(aws_subnet.base_subnet_public.*.id, count.index)
}

resource "aws_route_table" "base_route_table_private" {
  vpc_id = aws_vpc.plasmic_base.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.base_nat.id
  }
  tags = {
    Name = "${local.vpc_tag}-private-route"
  }
}

resource "aws_route_table_association" "base_route_table_private_association" {
  count          = length(var.private_subnet)
  route_table_id = aws_route_table.base_route_table_private.id
  subnet_id      = element(aws_subnet.base_subnet_private.*.id, count.index)
}

data "aws_s3_bucket" "log_bucket" {
  bucket = "plasmic-vpc-flowlogs"
}

resource "aws_flow_log" "base_infra_flow_logs" {
  traffic_type         = "ALL"
  log_destination      = data.aws_s3_bucket.log_bucket.arn
  log_destination_type = "s3"
  vpc_id               = aws_vpc.plasmic_base.id
  tags = {
    "Name" = "plasmic-base-vpc"
  }
}






