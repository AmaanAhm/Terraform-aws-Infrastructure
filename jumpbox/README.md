# terrafrom-common
terrafrom-common
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_jumpbox"></a> [jumpbox](#module\_jumpbox) | git@github.com:infra360io/terraform-modules.git//ec2 | v1.0.1 |
| <a name="module_public_alb"></a> [public\_alb](#module\_public\_alb) | git@github.com:infra360io/terraform-modules.git//alb | v1.0.5 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.ssh_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_security_group_rule.cloudflare_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cloudflare_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.jumpbox_ssh_nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/nat_gateway) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_custom_listener"></a> [add\_custom\_listener](#input\_add\_custom\_listener) | Whether to add custom listener | `bool` | `false` | no |
| <a name="input_add_http_listener"></a> [add\_http\_listener](#input\_add\_http\_listener) | n/a | `bool` | `true` | no |
| <a name="input_add_https_listener"></a> [add\_https\_listener](#input\_add\_https\_listener) | n/a | `bool` | `true` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Region id for S3 Bucket to be used as backend | `string` | `"default"` | no |
| <a name="input_az"></a> [az](#input\_az) | Availability zone id | `string` | `"ap-south-1a"` | no |
| <a name="input_cloudflare_cidr_blocks"></a> [cloudflare\_cidr\_blocks](#input\_cloudflare\_cidr\_blocks) | List of CIDRs to whitelist for CloudFlare | `map(any)` | <pre>{<br>  "103.21.244.0/22": "CloudFlare IP Range",<br>  "103.22.200.0/22": "CloudFlare IP Range",<br>  "103.31.4.0/22": "CloudFlare IP Range",<br>  "104.16.0.0/13": "CloudFlare IP Range",<br>  "104.24.0.0/14": "CloudFlare IP Range",<br>  "108.162.192.0/18": "CloudFlare IP Range",<br>  "131.0.72.0/22": "CloudFlare IP Range",<br>  "141.101.64.0/18": "CloudFlare IP Range",<br>  "162.158.0.0/15": "CloudFlare IP Range",<br>  "172.64.0.0/13": "CloudFlare IP Range",<br>  "173.245.48.0/20": "CloudFlare IP Range",<br>  "188.114.96.0/20": "CloudFlare IP Range",<br>  "190.93.240.0/20": "CloudFlare IP Range",<br>  "197.234.240.0/22": "CloudFlare IP Range",<br>  "198.41.128.0/17": "CloudFlare IP Range"<br>}</pre> | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | common tags | `map(string)` | <pre>{<br>  "env": "prod",<br>  "owner": "deepak.agrawal@infra360.io",<br>  "project": "vpc",<br>  "purpose": "networking",<br>  "terraform": "true"<br>}</pre> | no |
| <a name="input_custom_listener_port"></a> [custom\_listener\_port](#input\_custom\_listener\_port) | Custom listener port | `string` | `"8000"` | no |
| <a name="input_custom_string"></a> [custom\_string](#input\_custom\_string) | Initials for any service | `string` | `"custom"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Boolean to enable delete protection on the ALB | `string` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"prod"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | AMI Id for EC2 Instance | `string` | n/a | yes |
| <a name="input_instance_type_jumpbox"></a> [instance\_type\_jumpbox](#input\_instance\_type\_jumpbox) | EC2 instance type | `string` | `"t3.nano"` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the LB to be internal or not | `bool` | `false` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Load balancer type - ALB or NLB | `string` | `"application"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to create things in. | `string` | `"ap-south-1"` | no |
| <a name="input_ssh_cidr_list"></a> [ssh\_cidr\_list](#input\_ssh\_cidr\_list) | ssh cidr | `list(any)` | <pre>[<br>  "127.0.0.1/32"<br>]</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH public key | `string` | n/a | yes |
| <a name="input_subnet_tag"></a> [subnet\_tag](#input\_subnet\_tag) | Tag used on subnets to define subnet type | `string` | `"subnet_type"` | no |
| <a name="input_subnet_tag_value_public"></a> [subnet\_tag\_value\_public](#input\_subnet\_tag\_value\_public) | Subnet tag value | `string` | `"public"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name for the AWS account and region specified | `string` | `"prod"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
