output "ec2_private_ip" {
  value = aws_instance.instance.private_ip
}

output "ec2_id" {
  value = aws_instance.instance.id
}