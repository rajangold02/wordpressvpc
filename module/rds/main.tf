resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  subnets = ["${var.subnet_id}"]
  engine_version       = "5.7"
  instance_class       = "${var.instance_class}"
  vpc_security_group_ids      = ["${aws_security_group.rds.id}"]
  name                 = "mydb"
  username             = "ebizon"
  password             = "Ebizon12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = "true"
}

resource "aws_security_group" "rds" {
  vpc_id      = "${var.vpc_id}"
  name        = "allow-Access-rds"
  description = "security group that allows ssh,http and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name         = "allow_rds"
  }
  }
  
  