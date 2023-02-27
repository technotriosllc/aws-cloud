#resource "aws_iam_role" "plasmic_cluster_role" {
#  name               = "${var.cluster_name}-${var.env_code}-cluster-role"
#  assume_role_policy = <<POLICY
#  {
#    "Version": "2012-10-17",
#    "Statement": [
#    {
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "eks.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }
#    ]
#  }
#  POLICY
#}
#
#resource "aws_iam_role_policy_attachment" "plasmic_cluster_AmazonEKSClusterPolicy" {
#  policy_arn = "arn:aws:iam:policy/AmazonEKSClusterPolicy"
#  role       = aws_iam_role.plasmic_cluster_role.name
#}
#
#resource "aws_iam_role_policy_attachment" "plasmic_cluster_AmazonEKSVPCResourceController" {
#  policy_arn = "arn:aws:iam:policy/AmazonEKSVPCResourceController"
#  role       = aws_iam_role.plasmic_cluster_role.name
#}

resource "aws_security_group" "plasmic_cluster_sg" {
  name   = "${var.cluster_name}-${var.env_code}-${var.sg_suffix}"
  vpc_id = aws_vpc.plasmic_cluster_vpc.id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.cluster_name}-${var.env_code}-${var.sg_suffix}"
  }
}

resource "aws_security_group_rule" "plasmic_cluster_ingress__workstation_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.plasmic_cluster_sg.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "plasmic_cluster_ingress__workstation_https" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.plasmic_cluster_sg.id
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_eks_cluster" "plasmic_cluster" {
  name    = var.cluster_name
  version = "1.22"

  role_arn = "arn:aws:iam::939375546786:role/eksctl-plasmic-cluster-cluster-ServiceRole-PVK0VYEZANN4"
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    security_group_ids = [
      "sg-0ee2e951d9e33dc6a",
    ]
    public_access_cidrs = [
      "0.0.0.0/0"
    ]

    subnet_ids = [
      aws_subnet.cluster_subnet_private[0].id,
      aws_subnet.cluster_subnet_private[1].id,
      aws_subnet.cluster_subnet_private[2].id,
      aws_subnet.cluster_subnet_public[0].id,
      aws_subnet.cluster_subnet_public[1].id,
      aws_subnet.cluster_subnet_public[2].id
    ]

  }
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

}


