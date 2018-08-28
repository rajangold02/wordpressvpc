variable "availabilityZone" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "instance_tenancy" {
  default = "default"
}

variable "dns_support" {
  default = true
}

variable "dns_host_names" {
  default = true
}

variable "vpc_cidr_block" {
  default = "30.0.0.0/16"
}

variable "subnet_cidr_block1" {
  default = "30.0.1.0/24"
}

variable "subnet_cidr_block2" {
  default = "30.0.2.0/24"
}

variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}

variable "map_public_ip" {
  default = true
}
