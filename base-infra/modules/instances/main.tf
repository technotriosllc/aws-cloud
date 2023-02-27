
resource "aws_instance" "ec2_instance" {
  tags = {
    "Name"        = var.instance_name,
    "Owner"       = var.owner,
    "Environment" = var.env,
    "managed-by"  = var.managed_by
  }
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = var.public_ip_enabled
  private_ip                  = var.private_ip
  ebs_optimized               = var.ebs_optimized
  user_data                   = var.user_data_enabled ? var.user_data_base64 : 0
  user_data_replace_on_change = var.user_data_replace_on_change
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
    tags = {
      "Name"        = var.instance_name,
      "Owner"       = var.owner,
      "Environment" = var.env,
      "managed-by"  = var.managed_by
    }
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_eip" "lb" {
  count      = var.enable_eip ? 1 : 0
  instance   = aws_instance.ec2_instance.id
  vpc        = true
  depends_on = [aws_instance.ec2_instance]
  tags = {
    "Name"        = var.instance_name,
    "Owner"       = var.owner,
    "Environment" = var.env,
    "managed-by"  = var.managed_by
  }
}
#resource "aws_network_interface_sg_attachment" "default" {
#  network_interface_id = aws_instance.ec2_instance.primary_network_interface_id
#  security_group_id    = var.security_group
#  depends_on           = [aws_instance.ec2_instance]
#}
#
#resource "aws_ssm_document" "ssm_document" {
#  content = jsonencode({
#    schemaVersion = "1.0"
#    description   = "Document to hold regional settings for Session Manager"
#    sessionType   = "Standard_Stream"
#    inputs = {
#      s3BucketName                = ""
#      s3EncryptionEnabled         = false
#      cloudWatchLogGroupName      = ""
#      cloudWatchEncryptionEnabled = false
#      cloudWatchStreamingEnabled  = false
#      maxSessionDuration          = ""
#      runAsEnabled                = false
#      kmsKeyId                    = ""
#      shellProfile = {
#        linux   = var.linux_shell_profile
#        windows = var.windows_shell_profile
#      }
#    }
#
#  })
#  document_type = "Session"
#  name          = "SSM-SessionManagerRunShell"
#}
#resource "aws_ssm_association" "ssm_association" {
#  name = aws_ssm_document.ssm_document.name
#  targets {
#    key    = "InstanceIds"
#    values = [aws_instance.ec2_instance.id]
#  }
#}