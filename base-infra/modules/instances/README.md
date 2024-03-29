## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID to be used for the instance. | `string` | `null` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in. | `string` | `null` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | Whether the volume should be destroyed on instance termination. Defaults to true | `bool` | n/a | yes |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | Customize details about the ebs block device of instance. | `list(any)` | `null` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized | `bool` | n/a | yes |
| <a name="input_enable_eip"></a> [enable\_eip](#input\_enable\_eip) | n/a | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment details required for instance tagging | `string` | n/a | yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | Role to be attached to instance. | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name to be used on EC2 instance created. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to launch instance. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key Name of the Key Pair to use for the instance; Which can be managed using the 'aws\_key\_pair' resource. | `string` | `null` | no |
| <a name="input_linux_shell_profile"></a> [linux\_shell\_profile](#input\_linux\_shell\_profile) | The ShellProfile to use for linux based machines. | `string` | `"            exec /bin/bash\r\n            timestamp=$(date)\r\n            user=$(whoami)\r\n            echo $timestamp && echo \"Welcome $user\"'!'\r\n            echo \"You have logged in to a production instance. Note that all session activity is being logged.\"\r\n"` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | n/a | `string` | `"Managed by Terraform"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner details required for instance tagging. | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | Private IP address to associate with the instance. | `string` | `null` | no |
| <a name="input_public_ip_enabled"></a> [public\_ip\_enabled](#input\_public\_ip\_enabled) | If set true, it will assign public Ip to instance. | `bool` | `false` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | AWS security group IDs to associate with. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The VPC Subnet ID to lunch instance. | `string` | `null` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Can be used instead of user\_data to pass base64-encoded binary data directly. Use this instead of user\_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. | `string` | n/a | yes |
| <a name="input_user_data_enabled"></a> [user\_data\_enabled](#input\_user\_data\_enabled) | Check before passing user data. Default 'false' | `bool` | `false` | no |
| <a name="input_user_data_replace_on_change"></a> [user\_data\_replace\_on\_change](#input\_user\_data\_replace\_on\_change) | When used in combination with user\_data or user\_data\_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set. | `bool` | `false` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the volume in gibibytes (GiB). | `number` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2. | `string` | `"gp2"` | no |
| <a name="input_windows_shell_profile"></a> [windows\_shell\_profile](#input\_windows\_shell\_profile) | The shellProfile to use the windows based machines. | `string` | `"            $timestamp = (Get-Date).ToString(\"yyyy-MM-ddTH:mm:ssZ\")\r\n            $splitName = (whoami).Split(\"/\")\r\n            $user = $splitName[1]\r\n            Write-Host $timestamp\r\n            Write-Host \"Welcome $user!\"\r\n            Write-Host \"You have logged in to a production instance. Not that all session activity is being logged.\"\r\n"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | n/a |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | n/a |
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | n/a |
