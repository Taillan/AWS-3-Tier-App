# AWS-3-Tier-App
Credit: https://medium.com/@swastikaaryal/deploy-3-tier-web-app-with-terraform-ansible-and-route53-a4bc8753a1cf
Github : https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/tree/main?tab=readme-ov-file
YTB: https://www.youtube.com/watch?v=sCBTeMd0Jj4

# Step
## 1 - Create Network modules

This module will setup everythings we need to setup the network correctly for communicaiton between composant and with internet.

Include :
- vpc
- subnet
- Internet Gateway

Input : 
- vpc_cidr
- public_subnet1_cidr
- private_subnet1_cidr
- private_subnet2_cidr
- private_subnet3_cidr
- private_subnet4_cidr

Output :
- vpc_id
- vpc_public_subnet1_id
- vpc_private_subnet1_id
- vpc_private_subnet2_id
- vpc_private_subnet3_id
- vpc_private_subnet4_id

## 2 - Create security groups module
Input : 
- vpc_id
Output :
- security_group_id
