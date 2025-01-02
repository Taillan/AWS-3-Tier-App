variable "name" {
  type = string
  default = "terraform-sg"
  description = "Security Groups Name" 
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC where we will create ec2 instance"
}