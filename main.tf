module "network" {
    source = "./modules/network"
    vpc_cidr = "10.0.0.0/16"
    public_subnet1  = "10.0.1.0/24"
    private_subnet1 = "10.0.2.0/24"
    private_subnet2 = "10.0.3.0/24"
    private_subnet3 = "10.0.4.0/24"
    private_subnet4 = "10.0.5.0/24"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.network.vpc_id
}

module "ec2" {
    source = "./modules/ec2"
    user_data = "data.sh"
    name = "EC2_private_Instance"
    aws_security_group_id = module.security_groups.security_group_id
    vpc_id = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_1_id
    private_subnet1_id = module.network.application_subnet_1_id
    private_subnet2_id = module.network.application_subnet_1_id
}