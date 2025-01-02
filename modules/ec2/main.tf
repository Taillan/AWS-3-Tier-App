
resource  "aws_instance" "private_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.private_subnet1_id
    key_name = var.keypair
    security_groups = [var.aws_security_group_id]
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = false
    }
    tags ={
        Name = "terraform-private-instance"
        Owner = "Mathieu"
    }
}