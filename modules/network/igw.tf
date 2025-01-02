# Creating Internet Gateway 
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
}