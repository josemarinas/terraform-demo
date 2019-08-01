provider "aws" {
  version = "~> 2.8"
  region  = "${var.region}"
}

resource "aws_instance" "main" {
  count                   = "${var.instance_number}"
  ami                     = "${data.aws_ami.ami.id}"
  instance_type           = "${var.instance_type}"
  vpc_security_group_ids  = ["${var.security_group_id}"]
  
  network_interface {
    network_interface_id  = "${aws_network_interface.main[count.index].id}"
    device_index          = 0
  }

  tags = {
      Name = "${var.name}-instance"
  }
}

resource "aws_network_interface" "main" {
  count     = "${var.instance_number}"
  subnet_id = "${var.subnet_id}"
  tags = {
    Name = "${var.name}-network_interface"
  }
}


data "aws_ami" "ami" {
  most_recent = true
  owners      = ["${var.ami_owner}"] #  099720109477 Canonical

  filter {
    name      = "virtualization-type"
    values    = ["hvm"]
  }

  filter {
    name      = "architecture"
    values    = ["x86_64"]
  }

  filter {
    name      = "name"
    values    = ["${var.ami_name}"] # ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}