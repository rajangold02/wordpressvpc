resource "aws_vpc" "My_VPC" {
  cidr_block           = "${var.vpcCIDRblock}"
  instance_tenancy     = "${var.instanceTenancy}" 
  enable_dns_support   = "${var.dnsSupport}" 
  enable_dns_hostnames = "${var.dnsHostNames}"
tags {
    Name = "My custom VPC"
  }
} 

resource "aws_subnet" "My_VPC_Subnet1" {
  vpc_id                  = "${aws_vpc.My_VPC.id}"
  cidr_block              = "${var.subnetCIDRblock1}"
  map_public_ip_on_launch = "${var.mapPublicIP}" 
  availability_zone       = "us-east-1a"
tags = {
   Name = "My VPC Subnet1"
  }
} 
resource "aws_subnet" "My_VPC_Subnet2" {
  vpc_id                  = "${aws_vpc.My_VPC.id}"
  cidr_block              = "${var.subnetCIDRblock2}"
  map_public_ip_on_launch = "${var.mapPublicIP}" 
  availability_zone       = "us-east-1b"
tags = {
   Name = "My VPC Subnet2"
  }
} 

resource "aws_internet_gateway" "My_VPC_GW" {
  vpc_id = "${aws_vpc.My_VPC.id}"
tags {
        Name = "My VPC Internet Gateway"
    }
} 

resource "aws_route_table" "My_VPC_route_table" {
    vpc_id = "${aws_vpc.My_VPC.id}"
tags {
        Name = "My VPC Route Table"
    }
} 

resource "aws_route" "My_VPC_internet_access" {
  route_table_id        = "${aws_route_table.My_VPC_route_table.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  gateway_id             = "${aws_internet_gateway.My_VPC_GW.id}"
}

resource "aws_route_table_association" "My_VPC_association1" {
    subnet_id      = "${aws_subnet.My_VPC_Subnet1.id}"
    route_table_id = "${aws_route_table.My_VPC_route_table.id}"
}
resource "aws_route_table_association" "My_VPC_association2" {
    subnet_id      = "${aws_subnet.My_VPC_Subnet2.id}"
    route_table_id = "${aws_route_table.My_VPC_route_table.id}"
}