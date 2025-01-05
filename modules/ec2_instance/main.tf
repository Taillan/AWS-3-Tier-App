resource  "aws_instance" "instance" {

    # AMI ID to launch
    ami = var.ami_id

    # Instance type ( fe: t2.micro )
    instance_type = var.instance_type

    # VPC Subnet ID to associate with
    subnet_id = var.subnet_id

    # Key pair name to associate with
    key_name = var.keypair

    # List of security group names to associate with
    vpc_security_group_ids = [var.aws_security_group_id]
    
    # User data to provide when launching instance
    # user_data is a file containing the script to install web server
    user_data = file(var.user_data)
    
    # Associate a public IP address with the instance
    associate_public_ip_address = true

    # Block device mapping ( EBS volume )
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = false
    }
    tags ={
        Terraform = "true"
        Name = "terraform-${var.name}"
        Owner = var.owner
    }
}