resource "aws_lb" "hrapp_lb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.myhrapp_sg.id]
  subnets            = ["${aws_subnet.subnet_public1.id}", "${aws_subnet.subnet_public2.id}"]
  enable_deletion_protection = false

  tags = {
    Environment = "Project Environment"
  }
}

resource "aws_lb_target_group" "hrapp_tg" {
  name     = "hrapp-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.my-vpc
}

# Load balancer listening on port 80 and 443
resource "aws_lb_listener" "hrapp_listener1" {
  load_balancer_arn = aws_lb.hrapp_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hrapp_tg.arn
  }
}


resource "aws_lb_listener" "hrapp_listener2" {
  load_balancer_arn = aws_lb.hrapp_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hrapp_tg.arn
  }
}