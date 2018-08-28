resource "aws_vpc" "my_vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_support   = "${var.dns_support}"
  enable_dns_hostnames = "${var.dns_host_names}"

  tags {
    Name = "My custom VPC"
  }
}
data "aws_availability_zones" "available" {
}

resource "aws_subnet" "my_vpc_subnet1" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "${var.subnet_cidr_block1}"
  map_public_ip_on_launch = "${var.map_public_ip}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "My VPC Subnet1"
  }
}

resource "aws_subnet" "my_vpc_subnet2" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "${var.subnet_cidr_block2}"
  map_public_ip_on_launch = "${var.map_public_ip}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "My VPC Subnet2"
  }
}

resource "aws_internet_gateway" "my_vpc_gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags {
    Name = "My VPC Internet Gateway"
  }
}

resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags {
    Name = "My VPC Route Table"
  }
}

resource "aws_route" "my_vpc_internet_access" {
  route_table_id         = "${aws_route_table.my_vpc_route_table.id}"
  destination_cidr_block = "${var.destination_cidr_block}"
  gateway_id             = "${aws_internet_gateway.my_vpc_gw.id}"
}

resource "aws_route_table_association" "my_vpc_association1" {
  subnet_id      = "${aws_subnet.my_vpc_subnet1.id}"
  route_table_id = "${aws_route_table.my_vpc_route_table.id}"
}

resource "aws_route_table_association" "my_vpc_association2" {
  subnet_id      = "${aws_subnet.my_vpc_subnet2.id}"
  route_table_id = "${aws_route_table.my_vpc_route_table.id}"
}
