provider "aws" {
	region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "wordpressterraform"
    key    = "key"
    region = "us-east-1"
  }
}
module "rds" {
        source = "./module/rds"
		vpc_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "ec2" {
        source = "./module/ec2"
		vpc_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "elb" {
        source = "./module/elb"
		server_id = "${module.ec2.server_id}"
		vpc_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "vpc" {
         source = "./module/vpc"
}
