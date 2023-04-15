#!/bin/bash

# Install NGINX
echo "nginx"
sudo yum install nginx=${nginx_version} -y
sudo systemctl enable nginx --now

# Allow port 80 access to the webserver
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --reload

# Update index.html
sudo rm /usr/share/nginx/html/index.html && \
cat >/usr/share/nginx/html/index.html <<'EOF'
${file("src/app.html")}
EOF

# Restart NGINX
sudo systemctl restart nginx
