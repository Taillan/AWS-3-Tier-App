variable "name" {
  type = string
  default = "terraform-db-sg"
  description = "Security Groups Name" 
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC where we will create ec2 instance"
}

variable "owner" {
    type = string
    default = "Mathieu"
    description = "Owner of the ressource"
}

variable "input_sg_id" {
  type = string
  description = "value of the security group id allow to input"
  
}