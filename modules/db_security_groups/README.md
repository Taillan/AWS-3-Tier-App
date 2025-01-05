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
| [aws_security_group.ec2-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_sg_id"></a> [input\_sg\_id](#input\_input\_sg\_id) | value of the security group id allow to input | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Security Groups Name | `string` | `"terraform-db-sg"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the ressource | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where we will create ec2 instance | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
<!-- END_TF_DOCS -->