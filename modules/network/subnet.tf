#creating public subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags = {
    "Name" = "Terraform public subnet 1"
    Owner = var.owner
  }
}

#creating private subnet
resource "aws_subnet" "application_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1
  availability_zone = var.az[0]
  tags = {
    "Name" = "Terrqform application subnet 1"
    Owner = var.owner
  }
}

resource "aws_subnet" "application_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2
  availability_zone = var.az[1]
  tags = {
    "Name" = "Terraform application subnet 2"
    Owner = var.owner
  }
}
resource "aws_subnet" "database_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet3
  availability_zone = var.az[0]
  tags = {
    "Name" = "Terrafom database subnet 1"
  }
}
resource "aws_subnet" "database_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet4
  availability_zone = var.az[1]
  tags = {
    Terraform = "true"
    "Name" = "Terraform database subnet 2"
    Owner = var.owner
  }
}