output "public_subnets" {
  value = aws_subnet.base_subnet_public[*].id
}

output "private_subnets" {
  value = aws_subnet.base_subnet_private[*].id
}

output "vpc_id" {
  value = aws_vpc.plasmic_base.id
}

output "public_route_table_id" {
  value = aws_route_table.base_route_table_public.id
}

output "private_route_table_id" {
  value = aws_route_table.base_route_table_private.id
}