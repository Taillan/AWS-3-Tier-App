#############################################
# Load Balancer target group                #
#############################################
resource "aws_lb_target_group" "target_elb" {
  name     = "terraform-ALB-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Terraform = "true"
    Name      = "Terraform external alb target"
    Owner     = var.owner
  }
}

###################################################
# Target group link target_group <-> ec2.instance #
###################################################
resource "aws_lb_target_group_attachment" "attachment-ec2-1" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = var.target_list[0]
  port             = 80
}

###################################################
# Target group link target_group <-> ec2.instance #
###################################################
resource "aws_lb_target_group_attachment" "attachment-ec2-2" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = var.target_list[1]
  port             = 80
}


###################################################
# Listener define listen port on alb add action   #
###################################################
resource "aws_lb_listener" "external-alb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.target_elb.arn
}
}

###################################################
# External Application Load Balancer              #
###################################################
resource "aws_lb" "external-alb" {
  name               = "tf-external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ var.elb_security_group_id ]
  subnets            = var.elb_subnet_id_list
  access_logs {
    bucket  = var.bucket_name
    prefix  = "terraform_alb_logs"
    enabled = true
  }
  tags = {
    Terraform = "true"
    Name      = "terraform external Application Load Balancer"
    Owner     = var.owner
  }
}