output "vcp_id" {
  value = "${aws_vpc.my_vpc.id}"
}

output "subnet_id1" {
  value = "${aws_subnet.my_vpc_subnet1.id}"
}

output "subnet_id2" {
  value = "${aws_subnet.my_vpc_subnet2.id}"
}
