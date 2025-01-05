output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
    value = aws_subnet.public_subnet_1.id
}

output "application_subnet_1_id" {
    value = aws_subnet.application_subnet_1.id
}

output "application_subnet_2_id" {
    value = aws_subnet.application_subnet_2.id
}

output "database_subnet_1_id" {
    value = aws_subnet.database_subnet_1.id
}

output "database_subnet_2_id" {
    value = aws_subnet.database_subnet_2.id
}