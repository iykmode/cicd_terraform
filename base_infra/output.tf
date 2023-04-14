output "Jenkins-Node-Public-IP" {
  value = aws_instance.jenkins.public_ip
}

#Add LB DNS name to outputs.tf
output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}
