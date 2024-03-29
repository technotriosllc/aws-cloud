## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associated_vpc_id"></a> [associated\_vpc\_id](#input\_associated\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | This is the name of the hosted zone. | `string` | n/a | yes |
| <a name="input_enabled_hosted_zone"></a> [enabled\_hosted\_zone](#input\_enabled\_hosted\_zone) | To check, for enabling hosted zone. default FALSE | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required) ID of the VPC to associate. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internal_hosted_zone_id"></a> [internal\_hosted\_zone\_id](#output\_internal\_hosted\_zone\_id) | n/a |
