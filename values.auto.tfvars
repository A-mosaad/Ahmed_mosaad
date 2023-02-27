vpc_name = "vpc-demo"
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
subnet_name = ["public_subnet", "private_subnet"]
map = [true, false]
user_data_file  = <<-EOF
  #!/bin/bash
  echo "* Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "* Completed Installing apache2"
  EOF
ami = "ami-0557a15b87f6559cf"
instance_type = "t2.micro"
instance_name = ["web1", "web2"]
sg-name = "allow_ssh_http"
sg-description = "Allow ssh http inbound traffic"
ingress-ssh-desc = "ssh from vpc"
ingress-http-desc = "http from vpc"
protocol = "tcp"
sg-cidr-blocks = ["0.0.0.0/0"]
ipv6-cidr-blocks = ["::/0"]
igw-name = "igw"
igw-route-name = "example"
route-gw = "0.0.0.0/0"
nat-gw-name = "gw-NAT"
nat-route-name = "example"