resource "aws_lb" "load-balancer-terraform" {
  name               = "load-balancer-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg-terraform
  subnets = [for sub in var.public-subnets : sub]
  enable_deletion_protection = false
  tags = {
    Name = "load-balancer-terraform"
    createdby = "gs@presidio.com"
  }
}






resource "aws_lb_target_group" "target-group-terraform" {
  name     = "target-group-terraform"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "_lb_target_group_attachment_terraform" {
  count = length(var.instance_count)
  target_group_arn = aws_lb_target_group.target-group-terraform.arn
  target_id        = element(aws_instance.instance_terraform.*.id,count.index)
  port             = 80
}


resource "aws_lb_listener" "aws_lb_listener_terraform" {
  load_balancer_arn = aws_lb.load-balancer-terraform.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-terraform.arn
  }
}