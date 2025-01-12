# AWS-3-Tier

This Project was inspired by [SwastikaAryal](https://medium.com/@swastikaaryal/deploy-3-tier-web-app-with-terraform-ansible-and-route53-a4bc8753a1cf) and [DhruvinSoni30](https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/tree/main?tab=readme-ov-file) works.
# Preface

## What's AWS and Terraform
**Amazon Web Services (AWS)** is a comprehensive and widely adopted cloud platform that offers a variety of services such as computing power, storage, and databases. AWS enables businesses to scale and grow by providing on-demand resources and services.

**Terraform** is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows users to define and provision data center infrastructure using a high-level configuration language. Terraform enabling users to manage their infrastructure in a consistent and repeatable manner.

When used together, AWS and Terraform provide a powerful combination for managing cloud infrastructure. Terraform allows you to define your AWS resources in code. By applying these configurations, Terraform interacts with AWS APIs to create, update, and delete resources as specified in the code. This approach ensures that your infrastructure is always in the desired state and can be easily replicated across different environments.

## Repository Goal

This repository aim is to deploy a three tiers application Infrastructure :

1.  Front-end tier who will present the application to the user.
2. Back-end tier who make the link between database and Frontend.
3. DataBase tier where all the data will be stored.

For this goals we have choice this architecture : 

![InfraSchema](assets/Infra.drawio.svg)


A AWS S3 Bucket is used for Terraform Backend to save the tfstate

On each ressources tags are used :
- Owner -> To identified Owner. The variable value are asked at terraforn applied command
- Terraform -> To identified ressource create with Terraform

On AWS Console I have created a AWS Resource Groups to list them easily
# Step

## 1 - Create Network modules

This module will setup everythings we need to setup the network correctly for communicaiton between composant and with internet.
1 - VPC for inter connection between element

Include :
- vpc
- subnet
- Internet Gateway
- Route Table

## 2 - Create security groups module
### Front End SG
This will permit to allow ressource to use different protocol with port :
Input trafic  : 22,80,443
Output trafic : All

### Database SG
This will permit to communicate with DB by allowing inbound traffic from application identified by the security group id and outbound traffic from all the port

## 3 - Create the Front End instance

Thanks to module EC2 the tf file create 2 instance on 2 differente AZ. This instance are associated to the VPC and the respective public subnet create precedently. It will be usefull for Load Balancer

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