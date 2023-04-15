data "template_file" "init" {
  template = file("src/init.tpl")
  vars = {
    nginx_version = var.nginx_version
  }
}

resource "aws_instance" "webserver" {
  # provider                    = aws.region-main
  # ami                         = "ami-0532899d46335ff25"
  ami           = var.ami_id
  instance_type = var.instance-type
  user_data     = data.template_file.init.rendered
  #   user_data                   = templatefile(
  #     "src/init.tpl",
  #     {
  #         nginx_version = var.nginx_version
  #     })
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_grp]
  subnet_id                   = var.subnet_id

  tags = {
    Name = "app_main"
  }
}

resource "aws_lb_target_group_attachment" "webserver-attach" {
  #   provider         = aws.region-main
  target_group_arn = data.aws_lb_target_group.app-lb-tg.arn
  target_id        = aws_instance.webserver.id
  port             = var.webserver-port
}
