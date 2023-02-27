output "eks_cluster_id" {
  value = aws_eks_cluster.plasmic_cluster.id
}

output "eks_vpc_id" {
  value = aws_vpc.plasmic_cluster_vpc.id
}

output "public_route_table_id" {
  value = aws_route_table.public_vpc_route_table.id
}