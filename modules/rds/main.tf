# Creating RDS Instance
resource "aws_db_subnet_group" "database_subnet" {
    name       = var.db_subnet_group_name
    subnet_ids = var.database_subnet_id_list
    tags = {
        Name = "My DB subnet group"
        Terraform = "true"
        Owner = var.owner
    }
}
resource "aws_db_instance" "default" {
    allocated_storage      = 10
    db_subnet_group_name   = aws_db_subnet_group.database_subnet.id
    engine                 = "mysql"
    engine_version         = "8.0.39"
    instance_class         = "db.t3.micro"
    multi_az               = true
    db_name                = var.db_name
    username               = var.db_username
    password               = var.db_password
    skip_final_snapshot    = true
    vpc_security_group_ids = var.database-sg
}