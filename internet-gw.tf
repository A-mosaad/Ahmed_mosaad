resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw-name
  }
}
  resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route-gw
    gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
    Name = var.igw-route-name
  }

}

 resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main[0].id
  route_table_id = aws_route_table.example.id
}