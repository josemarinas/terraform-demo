variable "region" {
  default = "eu-west-1"
  description = "Region in which the vpc will be deployed"
}

variable "ami_owner" {
  default = "099720109477"
  description = "Range of private IP"
}

variable "name" {
  default = "default"
  description = "Name of the instance"
}

variable "ami_name" {
  default = "default"
  description = "Name of the AMI to search"
}

variable "instance_number" {
  default = 1
  description = "Number of instances that will be created"
}

variable "ssh_port" {
  default = 22
  description = "Port used for ssh"
}

variable "subnet_id" {
  description = "ID of the subnet"
}

variable "instance_type" {
  default = "t2.micro"
  description = "AWS instance type"
}

variable "security_group_id" {
  description = "Id of the security group"
}