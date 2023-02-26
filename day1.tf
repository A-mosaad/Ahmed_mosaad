provider "aws" {
    shared_config_files      = ["/root/config"]
    shared_credentials_files = ["/root/cred"]
    profile                  = "dev"
    region = "us-east-1" 
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "public-sub"
  }
}
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.main.id
  private_ips = ["10.0.0.100"]
  tags = {
    Name = "primary_network_interface"
  }
}
resource "aws_instance" "foo" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  key_name = iti
  subnet_id = aws_subnet.main.id
  security_groups = [aws_security_group.sg.id]
  
  user_data = <<-EOF
  #!/bin/bash
  echo "* Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "* Completed Installing apache2"
  EOF

  tags = {
    Name = "web_instance"
  }

  volume_tags = {
    Name = "web_instance"
  } 
  
}
resource "aws_security_group" "sg" {
  name        = "allow_http_ssh"
  description = "Allow http ssh inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
    Name = "example"
  }
}
  resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}
