resource "aws_kms_alias" "eks_cluster_key" {
  name          = "alias/EKSClusterKey"
  target_key_id = aws_kms_key.eks_kms_key.key_id
}

resource "aws_kms_key" "eks_kms_key" {
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = "false"
  is_enabled               = "true"
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = "false"
  policy                   = "{\"Id\":\"key-consolepolicy-3\",\"Statement\":[{\"Action\":\"kms:*\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::939375546786:root\"},\"Resource\":\"*\",\"Sid\":\"Enable IAM User Permissions\"},{\"Action\":[\"kms:Create*\",\"kms:Describe*\",\"kms:Enable*\",\"kms:List*\",\"kms:Put*\",\"kms:Update*\",\"kms:Revoke*\",\"kms:Disable*\",\"kms:Get*\",\"kms:Delete*\",\"kms:TagResource\",\"kms:UntagResource\",\"kms:ScheduleKeyDeletion\",\"kms:CancelKeyDeletion\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::939375546786:user/chungwu@plasmic.app\"},\"Resource\":\"*\",\"Sid\":\"Allow access for Key Administrators\"}],\"Version\":\"2012-10-17\"}"
}
