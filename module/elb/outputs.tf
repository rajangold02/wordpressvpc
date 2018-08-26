output "address" {
  value = "${aws_elb.example.dns_name}"
}