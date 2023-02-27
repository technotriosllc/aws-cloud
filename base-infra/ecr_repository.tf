#resource "aws_ecr_repository" "tfer--codegen-002D-server" {
#  encryption_configuration {
#    encryption_type = "AES256"
#  }
#
#  image_scanning_configuration {
#    scan_on_push = "false"
#  }
#
#  image_tag_mutability = "MUTABLE"
#  name                 = "codegen-server"
#
#  tags = {
#    OWNER = "yang"
#  }
#
#  tags_all = {
#    OWNER = "yang"
#  }
#}
#
#resource "aws_ecr_repository" "tfer--img-002D-optimizer" {
#  encryption_configuration {
#    encryption_type = "AES256"
#  }
#
#  image_scanning_configuration {
#    scan_on_push = "false"
#  }
#
#  image_tag_mutability = "MUTABLE"
#  name                 = "img-optimizer"
#
#  tags = {
#    OWNER = "yang"
#  }
#
#  tags_all = {
#    OWNER = "yang"
#  }
#}
#
#resource "aws_ecr_repository" "tfer--react-002D-renderer" {
#  encryption_configuration {
#    encryption_type = "AES256"
#  }
#
#  image_scanning_configuration {
#    scan_on_push = "false"
#  }
#
#  image_tag_mutability = "MUTABLE"
#  name                 = "react-renderer"
#
#  tags = {
#    OWNER = "yang"
#  }
#
#  tags_all = {
#    OWNER = "yang"
#  }
#}
#
#resource "aws_ecr_repository" "tfer--strapi" {
#  encryption_configuration {
#    encryption_type = "KMS"
#    kms_key         = "arn:aws:kms:us-west-2:939375546786:key/563f4b34-465d-4665-ae70-0b517aa3f806"
#  }
#
#  image_scanning_configuration {
#    scan_on_push = "false"
#  }
#
#  image_tag_mutability = "MUTABLE"
#  name                 = "strapi"
#}
