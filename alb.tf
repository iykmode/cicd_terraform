resource "aws_lb" "application-lb" {
  #   provider           = aws.region-main
  name               = "jenkins-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.app-subnet.id, aws_subnet.jenkins-subnet.id]
  tags = {
    Name = "Application-LB"
  }
}

#Create variable named webserver-port , type number , default 80
#Change port to variable in jenkins-sg group ingress rule which allows traffic from LB SG.

resource "aws_lb_target_group" "app-lb-tg" {
  #   provider    = aws.region-main
  name        = "app-lb-tg"
  port        = var.webserver-port
  target_type = "instance"
  vpc_id      = aws_vpc.vpc_main.id
  protocol    = "HTTP"
  health_check {
    enabled  = true
    interval = 10
    path     = "/"
    port     = var.webserver-port
    protocol = "HTTP"
    matcher  = "200-299"
  }
  tags = {
    Name = "jenkins-target-group"
  }
}

resource "aws_lb_listener" "jenkins-listener-http" {
  #   provider          = aws.region-main
  load_balancer_arn = aws_lb.application-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-lb-tg.id
  }
}


resource "aws_lb_target_group_attachment" "webserver-attach" {
  #   provider         = aws.region-main
  target_group_arn = aws_lb_target_group.app-lb-tg.arn
  target_id        = aws_instance.jenkins.id
  port             = var.webserver-port
}
