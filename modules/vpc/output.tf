output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_public_subnet1_id" {
    value = aws_subnet.public_subnet1.id
}

output "vpc_private_subnet1_id" {
    value = aws_subnet.private_subnet1.id
}

output "vpc_private_subnet2_id" {
    value = aws_subnet.private_subnet2.id
}

output "vpc_private_subnet3_id" {
    value = aws_subnet.private_subnet3.id
}

output "vpc_private_subnet4_id" {
    value = aws_subnet.private_subnet4.id
}