output "instance_id" {
  value = aws_instance.ec2_instance.id
}

output "instance_name" {
  value = aws_instance.ec2_instance.tags[*].Name
}

output "instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}