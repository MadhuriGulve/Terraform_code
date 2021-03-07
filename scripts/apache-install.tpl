#!/bin/bash
sudo yum update -y
sudo yum install apache2 -y
sudo systemctl start apache2
{{!--sudo bash -c 'Test web server > /var/www/html/index.html'--}}
echo "<h1>Hello World! at $(hostname -f) in AZ $EC2_AVAIL_ZONE </h1>” > /var/www/html/index.html