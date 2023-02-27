output "instance_public_ip" {
  value = aws_instance.foo[0].public_ip
}
output "instance_private_ip" {
  value = aws_instance.foo[1].private_ip
}
