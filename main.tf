resource "aws_instance" "webserver" {
  # provider                    = aws.region-main
  # ami                         = "ami-0532899d46335ff25"
  ami           = var.ami_id
  instance_type = var.instance-type
  # user_data                   = file("jenkins-setup.sh")
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_grp]
  subnet_id                   = var.subnet_id

  tags = {
    Name = "app_main"
  }
}
