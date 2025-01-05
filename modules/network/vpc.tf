resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Terraform = "true"
    "Name" = "Terrafom VPC"
    "owner" = var.owner
  }
}
