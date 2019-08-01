provider "aws" {
  version = "~> 2.8"
  region  = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_prefix}${var.cidr_mask}"
  tags = {
      Name = "${var.name}-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}${var.cidr_mask}"
  availability_zone = "${var.region}"

  tags = {
    Name = "${var.name}-subnet"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH Connections"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
}
