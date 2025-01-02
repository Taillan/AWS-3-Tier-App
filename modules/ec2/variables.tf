variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Free tier instance"
}

variable "aws_security_group_id" {
    type = string
  description = "Security groupe ID"
}

variable "ami_id" {
    type = string
    default = "ami-07dc1ccdcec3b4eab"
    description = "Amazon Linux 2023 AMI 2023.6.2"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "Vpc id associate to EC2 instance"
}

variable "keypair" {
  default = "EC2_Tuto_EU"
}

variable "private_subnet1_id" {
    type = string
}

variable "private_subnet2_id" {
    type = string
}

variable "public_subnet_id" {
    type = string
}