<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.external-alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.external-alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target_elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.attachment-ec2-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_lb_target_group_attachment.attachment-ec2-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket where the logs will be stored | `string` | `"terraform-elb-logs"` | no |
| <a name="input_elb_security_group_id"></a> [elb\_security\_group\_id](#input\_elb\_security\_group\_id) | value of the security group id link to alb | `string` | n/a | yes |
| <a name="input_elb_subnet_id_list"></a> [elb\_subnet\_id\_list](#input\_elb\_subnet\_id\_list) | list of subnet id link to alb | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the ELB | `string` | `"External Application Load Balancer"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the ressource | `string` | n/a | yes |
| <a name="input_target_list"></a> [target\_list](#input\_target\_list) | List of target id to link to the target group | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where we will create ec2 instance | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->