#!/bin/bash

# Install NGINX
sudo yum install nginx -y
sudo systemctl enable nginx --now

# Install Terraform
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --reload
