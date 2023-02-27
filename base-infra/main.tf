module "base_iam_policy" {
  source = "./modules/aws_account_policy"
}

module "base_vpc" {
  source         = "./modules/vpc"
  vpc_name       = "plasmic-base"
  region         = var.region
  vpc_cidr       = var.vpc_cidr
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
  az             = var.az

}

module "create_ec2_instance" {
  source                      = "./modules/instances"
  count                       = length(local.instance_details)
  instance_type               = local.instance_details[count.index].instance_type
  ami_id                      = local.instance_details[count.index].ami_id
  enable_eip                  = local.instance_details[count.index].enable_eip
  user_data_enabled           = local.instance_details[count.index].user_data_enabled
  user_data_base64            = local.instance_details[count.index].user_data_base64
  user_data_replace_on_change = local.instance_details[count.index].user_data_replace_on_change
  volume_size                 = local.instance_details[count.index].volume_size
  volume_type                 = local.instance_details[count.index].volume_type
  delete_on_termination       = local.instance_details[count.index].delete_on_termination
  security_group              = local.instance_details[count.index].security_group_id
  subnet_id                   = local.instance_details[count.index].subnet_id
  key_name                    = local.instance_details[count.index].key_name
  iam_instance_profile        = local.instance_details[count.index].iam_instance_profile
  instance_name               = local.instance_details[count.index].instance_name
  owner                       = local.instance_details[count.index].owner
  env                         = local.instance_details[count.index].env
  public_ip_enabled           = true
  availability_zone           = local.instance_details[count.index].az
  ebs_optimized               = local.instance_details[count.index].ebs_optimized


  depends_on = [
    module.base_vpc,
    module.base_iam_policy,
    aws_iam_role.instance_role,
    aws_iam_instance_profile.instance_profile,
    aws_iam_role_policy_attachment.ec2_ssm_policy_attachment,
  ]
}

module "eks_cluster" {
  source         = "./modules/eks-cluster"
  region         = var.region
  cluster_name   = var.eks_cluster_name
  env_code       = var.eks_env_code
  node_type      = var.eks_node_type
  desired_size   = var.eks_desired_size
  max_size       = var.eks_max_size
  min_size       = var.eks_min_size
  az             = var.eks_az
  vpc_cidr       = var.eks_vpc_cidr
  public_subnet  = var.eks_public_subnet
  private_subnet = var.eks_private_subnet
}