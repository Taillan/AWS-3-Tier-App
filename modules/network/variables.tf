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
  description = "Public CIDR subnet 1"

}
variable "public_subnet2" {
  type        = string
  default     = ""
  description = "Public CIDR subnet 2"

}
variable "private_subnet1" {
  type        = string
  default     = ""
  description = "Private CIDR subnet 1"

}
variable "private_subnet2" {
  type        = string
  default     = ""
  description = "Private CIDR subnet 2"

}
variable "private_subnet3" {
  type        = string
  default     = ""
  description = "Private CIDR subnet 3"

}
variable "private_subnet4" {
  type        = string
  default     = ""
  description = "Private CIDR subnet 4"
}