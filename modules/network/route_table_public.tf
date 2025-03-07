# Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id
route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet_gateway.id
  }
tags = {
    Terraform = "true"
    Name = "Terraform Route to internet"
    Owner = var.owner
  }
}

# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route.id
}

# Associating Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route.id
}