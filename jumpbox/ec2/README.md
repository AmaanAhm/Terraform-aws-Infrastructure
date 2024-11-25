# ec2

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.server_sg_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.server_sg_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnets.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate public ip with the server or not | `bool` | `false` | no |
| <a name="input_az"></a> [az](#input\_az) | Availability zone id | `string` | n/a | yes |
| <a name="input_custom_string"></a> [custom\_string](#input\_custom\_string) | Initials for any service | `string` | `"aws"` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | description | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `"dev"` | no |
| <a name="input_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#input\_iam\_instance\_profile\_name) | IAM Instance profile name | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | AMI Id | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 Instance type | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 Key pair name | `string` | n/a | yes |
| <a name="input_list_of_extra_sg_ids"></a> [list\_of\_extra\_sg\_ids](#input\_list\_of\_extra\_sg\_ids) | List of extra security groups to attach to ec2 servers | `list(any)` | `[]` | no |
| <a name="input_ssh_cidr_blocks_list"></a> [ssh\_cidr\_blocks\_list](#input\_ssh\_cidr\_blocks\_list) | description | `list(any)` | `[]` | no |
| <a name="input_subnet_tag"></a> [subnet\_tag](#input\_subnet\_tag) | Tag used on subnets to define Tier | `string` | `"subnet_type"` | no |
| <a name="input_subnet_tag_value"></a> [subnet\_tag\_value](#input\_subnet\_tag\_value) | Subnet tag value | `string` | `"public"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data for EC2 instance | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name for the AWS account and region specified | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_private_ip"></a> [server\_private\_ip](#output\_server\_private\_ip) | n/a |
| <a name="output_server_sg_id"></a> [server\_sg\_id](#output\_server\_sg\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
