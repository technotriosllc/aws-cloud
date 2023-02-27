output "vpc_id" {
  value = module.base_vpc.vpc_id
}

output "internal_hosted_zone" {
  value = module.internal_hosted_zone.internal_hosted_zone_id
}

output "instance_name" {
  value = module.create_ec2_instance[*].instance_name
}
output "instance_private_ip" {
  value = module.create_ec2_instance[*].instance_private_ip
}