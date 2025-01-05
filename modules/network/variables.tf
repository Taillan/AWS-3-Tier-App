variable "owner" {
    type = string
    description = "Owner of the ressource"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "VPC cidr"
}

variable "az" {
  default     = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  description = "Availability zone for subnets"
}

variable "public_subnet1" {
  type        = string
  default     = ""
  description = "Public subnet 1"

}
variable "public_subnet2" {
  type        = string
  default     = ""
  description = "Public subnet 2"

}
variable "application_subnet_1" {
  type        = string
  default     = ""
  description = "Application subnet 1"

}
variable "application_subnet_2" {
  type        = string
  default     = ""
  description = "Application subnet 2"

}
variable "database_subnet_1" {
  type        = string
  default     = ""
  description = "Database subnet 1"

}
variable "database_subnet_2" {
  type        = string
  default     = ""
  description = "Database subnet 2"
}