output "vcp_id" {
	value = "${aws_vpc.My_VPC.id}"
}
output "subnet_id1" {
	value = "${aws_subnet.My_VPC_Subnet1.id}"
}
output "subnet_id2" {
	value = "${aws_subnet.My_VPC_Subnet2.id}"
}