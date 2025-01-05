#############################################
# Load Balancer target group                #
#############################################
resource "aws_lb_target_group" "target_elb" {
  name     = "Terraform ALB Target Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Terraform = "true"
    Name      = "Terraform external alb target"
    Owner     = var.owner
  }
  
}

###################################################
# Target group link target_group <-> ec2.instance #
###################################################
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.external-alb.arn
  target_id        = var.target_list[0]
  port             = 80
}

###################################################
# Target group link target_group <-> ec2.instance #
###################################################
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.external-alb.arn
  target_id        = aws_instance.demoinstance1.id
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
  target_group_arn = aws_lb_target_group.external-alb.arn
}
}

###################################################
# External Application Load Balancer              #
###################################################
resource "aws_lb" "external-alb" {
  name               = "Terraform external Application Load Balancer"
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