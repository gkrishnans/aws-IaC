resource "aws_lb" "gokul-load-balancer-terraform" {
  name               = "gokul-load-balancer-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.gokul-sg-terraform.id]
    #[for sub in aws_subnet.vishal-tf-public-sub[*].id : sub]

  subnets = [for sub in aws_subnet.gokul_public_subnet[*].id : sub]
  enable_deletion_protection = true
  tags = {
    Name = "gokul-load-balancer-terraform"
    createdby = "gs@presidio.com"
  }
}

resource "aws_lb_target_group" "gokul-target-group-terraform" {
  name     = "gokul-target-group-terraform"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.gokul_vpc_terraform.id
}

resource "aws_lb_target_group_attachment" "gokul__lb_target_group_attachment_terraform" {
  count = length(var.instance_count)
  target_group_arn = aws_lb_target_group.gokul-target-group-terraform.arn
  target_id        = element(aws_instance.gokul_instance_terraform.*.id,count.index)
  port             = 80
}


resource "aws_lb_listener" "gokul_aws_lb_listener_terraform" {
  load_balancer_arn = aws_lb.gokul-load-balancer-terraform.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.gokul-target-group-terraform.arn
  }
}