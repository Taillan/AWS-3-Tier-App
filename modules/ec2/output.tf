output "ec2_private_ip" {
  value = aws_instance.private_instance.private_ip
}