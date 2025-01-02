resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "terraform_vpc"
    "owner" = "Mathieu"
  }
}

#creating public and private subnet
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags = {
    "Name" = "public_subnet1"
  }

}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1
  availability_zone = var.az[0]
  tags = {
    "Name" = "private_subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2
  availability_zone = var.az[1]
  tags = {
    "Name" = "private_subnet2"
  }
}
resource "aws_subnet" "private_subnet3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet3
  availability_zone = var.az[0]
  tags = {
    "Name" = "private_subnet3"
  }
}
resource "aws_subnet" "private_subnet4" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet4
  availability_zone = var.az[1]
  tags = {
    "Name" = "private_subnet4"
  }
}