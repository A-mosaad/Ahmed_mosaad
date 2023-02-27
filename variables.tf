variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}
variable "subnet_cidr_block" {
  type = list
}
variable "subnet_name" {
  type = list
}
variable "map" {
  type = list
}
variable "user_data_file" {
  type = string
}
variable "ami"{
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_name" {
  type = list
}
variable "sg-name" {
  type = string
}
variable "sg-description" {
  type = string
}
variable "ingress-ssh-desc" {
  type = string
}
variable "ingress-http-desc" {
  type = string
}
variable "protocol" {
  type = string
}
variable "sg-cidr-blocks" {
  type = list 
}
variable "ipv6-cidr-blocks" {
  type = list
}
variable "igw-name" {
  type = string
}
variable "igw-route-name" {
  type = string
}
variable "route-gw"{
   type = string
}
variable "nat-gw-name" {
  type = string
}
variable "nat-route-name" {
  type = string
}