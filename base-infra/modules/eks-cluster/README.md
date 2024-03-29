## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.plasmic_cluster_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eks_cluster.plasmic_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.plasmic_cluster_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_flow_log.eks_infra_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.plasmic_cluster_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEKSWorkerPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AmazonSSMManagedInstanceCore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.vpc_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.plasmic_cluster_nat_gwy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_a_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_route_b_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_route_c_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_vpc_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_vpc_a_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_vpc_b_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_vpc_c_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_vpc_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.plasmic_cluster_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.plasmic_cluster_ingress__workstation_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.plasmic_cluster_ingress__workstation_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.cluster_subnet_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.cluster_subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.plasmic_cluster_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [random_string.random_vpc](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_s3_bucket.log_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | AWS Availability zone | `list(string)` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Elastic kubernetes Service Cluster Name. | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Node group desired count. | `number` | `1` | no |
| <a name="input_env_code"></a> [env\_code](#input\_env\_code) | Environment code Expected values: dev, qa, staging, uat, prod | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Node group max node size. | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Node group minimum node size. | `number` | `1` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Instance type for node group. | `string` | `"c6a.xlarge"` | no |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | Private Subnet for AWS VPC. | `list(string)` | `null` | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Public subnet for AWS VPC. | `list(string)` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy eks cluster. | `string` | n/a | yes |
| <a name="input_sg_suffix"></a> [sg\_suffix](#input\_sg\_suffix) | n/a | `string` | `"SG"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_id"></a> [eks\_cluster\_id](#output\_eks\_cluster\_id) | n/a |
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | n/a |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | n/a |
