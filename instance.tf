resource "aws_instance" "foo" {
  ami = var.ami
  count = 2
  instance_type = var.instance_type
  key_name = iti
  subnet_id = aws_subnet.main[count.index].id
  security_groups = [aws_security_group.sg.id]
  
  user_data = var.user_data_file

  tags = {
    Name = var.instance_name[count.index]
  }

  volume_tags = {
    Name = var.instance_name[count.index]
  } 
}