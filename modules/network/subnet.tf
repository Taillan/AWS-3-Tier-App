#creating public subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags = {
    "Name" = "public_subnet1"
    Owner = var.owner
  }
}

#creating private subnet
resource "aws_subnet" "application_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1
  availability_zone = var.az[0]
  tags = {
    "Name" = "private_subnet1"
    Owner = var.owner
  }
}

resource "aws_subnet" "application_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2
  availability_zone = var.az[1]
  tags = {
    "Name" = "private_subnet2"
    Owner = var.owner
  }
}
resource "aws_subnet" "database_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet3
  availability_zone = var.az[0]
  tags = {
    "Name" = "private_subnet3"
  }
}
resource "aws_subnet" "database_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet4
  availability_zone = var.az[1]
  tags = {
    Terraform = "true"
    "Name" = "private_subnet4"
    Owner = var.owner
  }
}