data "aws_iam_role" "tech_test_role" {
  # provider = aws.region-main
  name = "tech_test_role"
}

resource "aws_iam_instance_profile" "tech-test-profile" {
  name = "tech_test_profile"
  role = data.aws_iam_role.tech_test_role.name
}

#Create and bootstrap EC2 in eu-west-1
resource "aws_instance" "jenkins" {
  # provider                    = aws.region-main
  # ami                         = "ami-0532899d46335ff25"
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance-type
  user_data                   = file("jenkins-setup.sh")
  iam_instance_profile        = aws_iam_instance_profile.tech-test-profile.name
  key_name                    = aws_key_pair.master-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.jenkins-subnet.id

  tags = {
    Name = "jenkins_main_tf"
  }

  depends_on = [aws_main_route_table_association.set-public-subnet-route-table]
}
