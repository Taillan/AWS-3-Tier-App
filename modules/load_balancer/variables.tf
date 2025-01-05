variable "bucket_name" {
  type = string
  default = "terraform-elb-logs"
  description = "Name of the bucket where the logs will be stored"
  
}

variable "vpc_id" {
  type = string
  description = "VPC where we will create ec2 instance"
}

variable "elb_security_group_id" {
  type = string
  description = "value of the security group id link to alb"
}

variable "elb_subnet_id_list" {
  type = list(string)
  description = "list of subnet id link to alb"
}

variable "owner" {
  type = string
  description = "Owner of the ressource"
}

variable "name" {
  type = string
  default = "External Application Load Balancer"
  description = "Name of the ELB" 
  
}

variable "target_list" {
  type = list(string)
  description = "List of target id to link to the target group"
  
}