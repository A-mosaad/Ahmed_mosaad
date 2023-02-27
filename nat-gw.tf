resource "aws_eip" "bar" {
  vpc = true
  depends_on                = [aws_internet_gateway.igw]
}
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.bar.id
  subnet_id     = aws_subnet.main[0].id

  tags = {
    Name = var.nat-gw-name 
  }

  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "test-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route-gw
    gateway_id = aws_nat_gateway.example.id
  }
    tags = {
    Name = var.nat-route-name
  }
}
  resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main[1].id
  route_table_id = aws_route_table.test-route.id
}