resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  count = 2
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch = var.map[count.index]
  cidr_block = var.subnet_cidr_block[count.index]
  tags = {
    Name = var.subnet_name[count.index]
  }
}