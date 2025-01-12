# AWS-3-Tier

This Project was inspired by [SwastikaAryal](https://medium.com/@swastikaaryal/deploy-3-tier-web-app-with-terraform-ansible-and-route53-a4bc8753a1cf) and [DhruvinSoni30](https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/tree/main?tab=readme-ov-file) works.
# Preface

## What's AWS and Terraform
**Amazon Web Services (AWS)** is a comprehensive and widely adopted cloud platform that offers a variety of services such as computing power, storage, and databases. AWS enables businesses to scale and grow by providing on-demand resources and services.

**Terraform** is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows users to define and provision infrastructure using a high-level configuration language. Terraform enabling users to manage their infrastructure in a consistent and repeatable manner.

When used together, AWS and Terraform provide a powerful combination for managing cloud infrastructure. Terraform allows you to define your AWS resources in code. By applying these configurations, Terraform interacts with AWS APIs to create, update, and delete resources as specified in the code. This approach ensures that your infrastructure is always in the desired state and can be easily replicated across different environments.

## Repository Goal

This repository aim is to deploy a three tiers application Infrastructure :

1. Front-end tier who will present the application to the user.
2. Back-end tier who make the link between database and Frontend.
3. DataBase tier where all the data will be stored.

For this goals we have choice the following architecture : 

![InfraSchema](assets/Infra.drawio.svg)

## Technical details
### Terraform Backend
An AWS S3 Bucket is used for Terraform Backend to save the tfstate

**providers.tf**
```hcl providers.tf
terraform {
  backend "s3" {
    bucket = "taillan-terraform-backend"
    key    = "terraform"
    region = "eu-west-3"
  }
}
```

On each ressources tags are used :
- Owner -> To identified Owner. The variable value are asked at terraforn applied command
- Terraform -> To identified ressource create with Terraform

```hcl
    tags ={
        Name = "terraform-${var.name}"
        Terraform = "true"
        Owner = var.owner
    }
```

This allow on AWS Console to created a AWS Resource Groups to list them easily.

# Step

## 1 - Create Network modules

This module will setup everythings we need to setup the network correctly for communicaiton between composant and with internet.
1 - VPC for inter connection between element

Include :
- Network subdivision
  - vpc
  - subnet
- Internet Access
  - Internet Gateway
  - Route Table

### NetWork Subdivision

#### The VPC and subnets

This file vpc.tf will create an AWS VPC a logically isolated network within the Amazon Web Services (AWS) cloud.

```hcl
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Terraform = "true"
    "Name" = "Terrafom VPC"
    "owner" = var.owner
  }
}
```

After we create the different subnets. Each subnet have a duplicate one in a different AZ to assure **High Avaibility**

```hcl
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr_subnet_1
  map_public_ip_on_launch = true
  availability_zone       = var.az[0]
  tags = {
    Terrafom = "true"
    "Name" = "Terraform public subnet 1"
    Owner = var.owner
  }
```

The subnet is public due to the ``map_public_ip_on_launch`` option who will expose it. It will be necessary for the LoadBalancer. For the other subnet thei're not exposed and stay private as define in the architecture.

#### The IGW and route tables

The public subnets are link with a route table to an Internet Gateway (IGW). it's essential to allow our FrontEnd EC2 instances within those subnets to communicate with the internet.

First we create the IGW
```json
# Creating Internet Gateway 
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Terraform = "true"
    Name  = "Terraform IG"
    Owner = var.owner
  }
}
```

Then we create route table to associate subnet with the IGW

```hcl
# Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id
route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.internet_gateway.id
  }
tags = {
    Terraform = "true"
    Name = "Terraform Route to internet"
    Owner = var.owner
  }
}

# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route.id
}
```

## 2 - Create security groups module

Security groups in AWS is the ressource who define Traffic rules. We have to create 2 differents

### Front End SG module

This will permit to allow ressource to use different protocol with port :
Input trafic  : 22,80,443
Output trafic : All

```hcl
resource "aws_security_group" "ec2-sg" {
  name        = var.name
  description = "EC2 Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Terraform = "true"
    Name  = "Terraform Front SG"
    Owner = var.owner
  }

  # SSH rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS rule
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

### Database SG module
This will permit to communicate with DB by allowing inbound traffic from application identified by the security group id and outbound traffic from all the port

```json
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
```

## 3 - Create the instance module

A simple script is use for user_data to host a simple web page

## 4 - Load Balancer

The Load Balancer Module allow to instantiate a load_balancer and linked it to the EC2 Instance created for the front end. The logs are published in a bucket with the good bucket policy 

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::009996457667:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::terraform-elb-logs/*"
        }
    ]
}
```

## 5 - RDS

The RDS will serve to store the data.
Password and User are define in a local terraform.tfvars to stay secret

# Deploy command

To deploy the architecture you can use the command 
```bash
terraform apply -var-file="terraform.tfvars"
```

# Next Step:

Deploy an Application on this by usin Ansible