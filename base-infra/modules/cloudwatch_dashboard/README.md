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
| [aws_cloudwatch_dashboard.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_body"></a> [dashboard\_body](#input\_dashboard\_body) | Details fo cloudwatch dashboard design. | `any` | n/a | yes |
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | Name for Cloudwatch dashboard. | `string` | n/a | yes |

## Outputs

No outputs.
