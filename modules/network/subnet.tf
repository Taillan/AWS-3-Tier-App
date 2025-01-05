#creating public subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags = {
    Terrafom = "true"
    "Name" = "Terraform public subnet 1"
    Owner = var.owner
  }

}#creating public subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2
  map_public_ip_on_launch = true
  availability_zone       = var.az[1]
  tags = {
    Terrafom = "true"
    "Name" = "Terraform public subnet 2"
    Owner = var.owner
  }
}

#creating private subnet
resource "aws_subnet" "application_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.application_subnet_1
  availability_zone = var.az[0]
  tags = {
    Terrafom = "true"
    "Name" = "Terraform application subnet 1"
    Owner = var.owner
  }
}

resource "aws_subnet" "application_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.application_subnet_2
  availability_zone = var.az[1]
  tags = {
    Terrafom = "true"
    "Name" = "Terraform application subnet 2"
    Owner = var.owner
  }
}
resource "aws_subnet" "database_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_1
  availability_zone = var.az[0]
  tags = {
    Terrafom = "true"
    "Name" = "Terrafom database subnet 1"
    Owner = var.owner
  }
}
resource "aws_subnet" "database_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_2
  availability_zone = var.az[1]
  tags = {
    Terraform = "true"
    "Name" = "Terraform database subnet 2"
    Owner = var.owner
  }
}