resource "aws_security_group" "ec2-sg" {
  name        = var.name
  description = "Allow inbound traffic from application layer"
  vpc_id      = var.vpc_id

  tags = {
    Name  = "Terraform DB SG"
    Terraform = "true"
    Owner = var.owner
  }

  # Allow inbound traffic from application identified by the security group id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    description = "Allow inbound traffic from application layer"
    security_groups = [var.input_sg_id] 
  }

  # Allow outbound traffic from all the port between 32768 and 65535
  egress{
    from_port = 32768
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}