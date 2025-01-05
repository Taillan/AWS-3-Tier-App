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
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rt1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rt2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.application_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.application_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.database_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.database_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_cidr_subnet_1"></a> [application\_cidr\_subnet\_1](#input\_application\_cidr\_subnet\_1) | Application subnet 1 | `string` | `""` | no |
| <a name="input_application_cidr_subnet_2"></a> [application\_cidr\_subnet\_2](#input\_application\_cidr\_subnet\_2) | Application subnet 2 | `string` | `""` | no |
| <a name="input_az"></a> [az](#input\_az) | Availability zone for subnets | `list` | <pre>[<br/>  "eu-west-3a",<br/>  "eu-west-3b",<br/>  "eu-west-3c"<br/>]</pre> | no |
| <a name="input_database_cidr_subnet_1"></a> [database\_cidr\_subnet\_1](#input\_database\_cidr\_subnet\_1) | Database subnet 1 | `string` | `""` | no |
| <a name="input_database_cidr_subnet_2"></a> [database\_cidr\_subnet\_2](#input\_database\_cidr\_subnet\_2) | Database subnet 2 | `string` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the ressource | `string` | n/a | yes |
| <a name="input_public_cidr_subnet_1"></a> [public\_cidr\_subnet\_1](#input\_public\_cidr\_subnet\_1) | Public subnet 1 | `string` | `""` | no |
| <a name="input_public_cidr_subnet_2"></a> [public\_cidr\_subnet\_2](#input\_public\_cidr\_subnet\_2) | Public subnet 2 | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC cidr | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_subnet_1_id"></a> [application\_subnet\_1\_id](#output\_application\_subnet\_1\_id) | n/a |
| <a name="output_application_subnet_2_id"></a> [application\_subnet\_2\_id](#output\_application\_subnet\_2\_id) | n/a |
| <a name="output_database_subnet_1_id"></a> [database\_subnet\_1\_id](#output\_database\_subnet\_1\_id) | n/a |
| <a name="output_database_subnet_2_id"></a> [database\_subnet\_2\_id](#output\_database\_subnet\_2\_id) | n/a |
| <a name="output_public_subnet_1_id"></a> [public\_subnet\_1\_id](#output\_public\_subnet\_1\_id) | n/a |
| <a name="output_public_subnet_2_id"></a> [public\_subnet\_2\_id](#output\_public\_subnet\_2\_id) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->