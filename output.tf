output "App-Node-Public-IP" {
  value = aws_instance.webserver.public_ip
}

#Add LB DNS name to outputs.tf
output "App-Node-Private-IP" {
  value = aws_instance.webserver.private_ip
}
