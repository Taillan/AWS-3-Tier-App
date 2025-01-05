# AWS-3-Tier-App
- Credit: https://medium.com/@swastikaaryal/deploy-3-tier-web-app-with-terraform-ansible-and-route53-a4bc8753a1cf
- Github : https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/tree/main?tab=readme-ov-file
- YTB: https://www.youtube.com/watch?v=sCBTeMd0Jj4

# Preface

On each ressources tags are used :
- Owmer -> To identified Owner. The variable value are asked at terraforn applied command
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

The Load Balancer Module allow to instantiate a LoadBalancer and linked it to the EC2 Instance created for the front end. The logs are published in a bucket with the good bucket policy 

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

