locals {
  region = "eu-west-1"
	cidr_prefix = "10.0.0.0"
	name = "demo"

	ami_owner = "" #introduce here the ami owner
}

provider "aws" {
  version = "~> 2.8"
  region  = "${local.region}"
}

module "vpc" {
  source = "./modules/vpc"
  region = "${local.region}"
  cidr_prefix = "${local.cidr_prefix}"
	cidr_mask = "/16"
	subnet_mask = "/24"
	name = "${local.name}"
}

module "instance" {
  source = "./modules/instance"
  region = "${local.region}"
  ami_owner = "${local.ami_owner}"
	name = "${local.name}"
	instance_number = 1
	subnet_id = "${module.vpc.subnet_id}"
	instance_type = "t2.micro"
	security_group_id = "${module.vpc.security_group_id}"
}
