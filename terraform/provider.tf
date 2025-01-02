terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-3"
  profile = "default"
}