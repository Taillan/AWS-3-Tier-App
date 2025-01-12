######################################################
# Terraform module to generate all network resources #
######################################################

module "network" {
    source = "./modules/network"
    vpc_cidr = "10.0.0.0/16"
    owner = var.owner
    public_cidr_subnet_1       = "10.0.1.0/24"
    public_cidr_subnet_2       = "10.0.2.0/24"
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
  input_sg_id = module.front_security_groups.id
    owner = var.owner
}

module "Frontend_1" {
    source = "./modules/ec2_instance"
    user_data = "FrontEnd.sh"
    name = "Terraform EC2 Front 1"
    aws_security_group_id = module.front_security_groups.id
    vpc_id = module.network.vpc_id
    subnet_id = module.network.public_subnet_1_id
    owner = var.owner
}

module "Frontend_2" {
    source = "./modules/ec2_instance"
    user_data = "FrontEnd.sh"
    name = "Terraform EC2 Front 2"
    aws_security_group_id = module.front_security_groups.id
    vpc_id = module.network.vpc_id
    subnet_id = module.network.public_subnet_2_id
    owner = var.owner
}

module "BackeEnd_1" {
    source = "./modules/ec2_instance"
    user_data = "BackEnd.sh"
    name = "Terraform EC2 Back 1"
    aws_security_group_id = module.front_security_groups.id
    vpc_id = module.network.vpc_id
    subnet_id = module.network.application_subnet_1_id
    owner = var.owner
}

module "BackeEnd_2" {
    source = "./modules/ec2_instance"
    user_data = "BackEnd.sh"
    name = "Terraform EC2 Back 2"
    aws_security_group_id = module.front_security_groups.id
    vpc_id = module.network.vpc_id
    subnet_id = module.network.application_subnet_2_id
    owner = var.owner
}

module "load_balancer" {
    source = "./modules/load_balancer"
    owner = var.owner
    vpc_id = module.network.vpc_id
    elb_security_group_id = module.front_security_groups.id
    elb_subnet_id_list = [ module.network.public_subnet_1_id,module.network.public_subnet_2_id] #, module.network.public_subnet_2_id]
    bucket_name = "terraform-elb-logs"
    target_list = [ module.Frontend_1.ec2_id, module.Frontend_2.ec2_id ]

    depends_on = [
      module.Frontend_1,
      module.Frontend_2
    ]
  
}

module "rds" {
    count = 0
    source = "./modules/rds"
    db_subnet_group_name = "main"
    db_name = "mydb"
    db_username = var.db_username
    db_password = var.db_password
    database-sg = [module.db_security_groups.id]
    database_subnet_id_list = [module.network.database_subnet_1_id, module.network.database_subnet_2_id]
    owner = var.owner
  depends_on = [
      module.network
    ]
}