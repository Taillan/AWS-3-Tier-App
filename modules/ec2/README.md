<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | Amazon Linux 2023 AMI 2023.6.2 | `string` | `"ami-07dc1ccdcec3b4eab"` | no |
| <a name="input_aws_security_group_id"></a> [aws\_security\_group\_id](#input\_aws\_security\_group\_id) | Security groupe ID | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Free tier instance | `string` | `"t2.micro"` | no |
| <a name="input_keypair"></a> [keypair](#input\_keypair) | n/a | `string` | `"EC2_Tuto_EU"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the EC2 instance | `string` | `"EC2_Instance"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the ressource | `string` | n/a | yes |
| <a name="input_private_subnet1_id"></a> [private\_subnet1\_id](#input\_private\_subnet1\_id) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `string` | `"user_data.sh"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Vpc id associate to EC2 instance | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | n/a |
| <a name="output_ec2_private_ip"></a> [ec2\_private\_ip](#output\_ec2\_private\_ip) | n/a |
<!-- END_TF_DOCS -->