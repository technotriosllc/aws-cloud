resource "aws_iam_role" "plasmic_cluster_nodes" {
  name               = "eksctl-plasmic-cluster-nodegroup-NodeInstanceRole-19L6L9HEWUZ3B"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
  {
    "Effect": "Allow",
    "Principal": {
      "Service": "ec2.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
    }
  ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKSWorkerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.plasmic_cluster_nodes.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.plasmic_cluster_nodes.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.plasmic_cluster_nodes.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.plasmic_cluster_nodes.name
}

resource "aws_eks_node_group" "plasmic_cluster_node_group" {
  cluster_name    = aws_eks_cluster.plasmic_cluster.name
  node_group_name = "internal-c6a-xlarge-eksctl-20220715T2301"
  node_role_arn   = aws_iam_role.plasmic_cluster_nodes.arn
  subnet_ids      = flatten([aws_subnet.cluster_subnet_public.*.id])
  instance_types  = [var.node_type]
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerPolicy
  ]
}