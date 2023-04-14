#Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
  # provider   = aws.region-main
  key_name   = "jenkins"
  public_key = file("~/.ssh/jenkins_id_rsa.pub")
}
