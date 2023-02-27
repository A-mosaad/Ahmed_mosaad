resource "aws_security_group" "sg" {
  name        = var.sg-name
  description = var.sg-description
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = var.ingress-http-desc
    from_port        = 80
    to_port          = 80
    protocol         = var.protocol
    cidr_blocks      = var.sg-cidr-blocks
    ipv6_cidr_blocks = var.ipv6-cidr-blocks
  }
  ingress {
    description      = var.ingress-ssh-desc
    from_port        = 22
    to_port          = 22
    protocol         = var.protocol
    cidr_blocks      = var.sg-cidr-blocks
    ipv6_cidr_blocks = var.ipv6-cidr-blocks
  }

  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg-cidr-blocks
    ipv6_cidr_blocks = var.ipv6-cidr-blocks
  }

  tags = {
    Name = var.sg-name
  }
}
