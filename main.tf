provider "aws" {
region = "us-east-1"
access_key = "AKIASYPD4K2CYI4RVHEG"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0e9107ed11be76fde"
instance_type = "t2.medium"
  key_name = "terrafrom-project"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1a"
  user_data = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd 
chkconfig httpd on
echo "Hai All This is My Zomato Web-Application Created by Terraform Infrastructute By Yashaswini Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0e9107ed11be76fde"
instance_type = "t2.medium"
  key_name = "terrafrom-project"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1b"
  user_data = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "Hai All This is My Swiggy Web-Application Created by Terraform Infrastructute By Yashaswini Server-2" > /var/www/html/index.html
EOF
tags = {
Name = "Swiggy-01"
}
}

 
