#!/bin/bash
sudo apt update
sudo apt install -y apache2
echo 'Hello from Terraform' > /var/www/html/index.html
systemcetl restart apache2