variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "database-sg" {
  description = "The security group IDs to assign to the RDS instance"
  type        = list(string)
}

variable "database_subnet_id_list" {
  description = "The list of subnet IDs for the RDS database"
  type        = list(string)
}

variable "owner" {
  type        = string
  description = "Owner of the ressource"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the RDS subnet group"
  type        = string
}