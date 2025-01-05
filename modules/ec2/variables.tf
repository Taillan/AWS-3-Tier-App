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

variable "subnet_id" {
    type = string
}

variable "user_data" {
    type = string
    default = "user_data.sh"
  
}

variable "name" {
    type = string
    default = "EC2_Instance"
    description = "Name of the EC2 instance"
  
}

variable "owner" {
    type = string
    description = "Owner of the ressource"
}
