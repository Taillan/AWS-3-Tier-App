######################################################
# Terraform module to generate all network resources #
######################################################

module "network" {
    source = "./modules/network"
    vpc_cidr = "10.0.0.0/16"
    owner = var.owner
    public_cidr_subnet_1        = "10.0.1.0/24"
    public_cidr_subnet_2        = "10.0.2.0/24"
    application_cidr_subnet_1  = "10.0.3.0/24"
    application_cidr_subnet_2  = "10.0.4.0/24"
    database_cidr_subnet_1     = "10.0.5.0/24"
    database_cidr_subnet_2     = "10.0.6.0/24"
}

module "front_security_groups" {
  source = "./modules/front_security_groups"
  vpc_id = module.network.vpc_id
    owner = var.owner
}

module "db_security_groups" {
  source = "./modules/db_security_groups"
  vpc_id = module.network.vpc_id
  input_sg_id = module.front_security_groups.security_group_id
    owner = var.owner
}

module "ec2_1" {
    source = "./modules/ec2"
    user_data = "data.sh"
    name = "Terraform EC2 Front 1"
    aws_security_group_id = module.front_security_groups.security_group_id
    vpc_id = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_1_id
    private_subnet1_id = module.network.application_subnet_1_id
    owner = var.owner
}

module "ec2_2" {
    source = "./modules/ec2"
    user_data = "data.sh"
    name = "Terraform EC2 Front 2"
    aws_security_group_id = module.front_security_groups.security_group_id
    vpc_id = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_2_id
    private_subnet1_id = module.network.application_subnet_1_id
    owner = var.owner
}

module "LoadBalancer" {
    source = "./modules/LoadBalancer"
    owner = var.owner
    vpc_id = module.network.vpc_id
    elb_security_group_id = module.front_security_groups.security_group_id
    elb_subnet_id_list = [ module.network.public_subnet_1_id, module.network.public_subnet_2_id]
    bucket_name = "terraform-elb-logs"
    target_list = [ module.ec2_1.ec2_id, module.ec2_2.ec2_id ]

    depends_on = [
      module.ec2_1,
      module.ec2_2
    ]
  
}