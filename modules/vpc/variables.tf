variable "region" {
    default = "eu-west-1"
    description = "Region in which the vpc will be deployed"
}

variable "cidr_prefix" {
    default = "10.0.0.0"
    description = "Private IP prefix"
}

variable "cidr_mask" {
  default = "/16"
  description = "CIDR mask"
}

variable "subnet_mask" {
  default = "/24"
  description = "Subnet mask"
}


variable "name" {
    default = "default"
    description = "Name of the VPC"
}

variable "avaliability_zone" {
    default = "a"
    description = "Availability zone of the subnet"
}
