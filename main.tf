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
		vcp_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "ec2" {
        source = "./module/ec2"
		vcp_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "elb" {
        source = "./module/elb"
		instance-id = "${module.ec2.server_id}"
		vcp_id = "${module.vpc.vcp_id}"
		subnet_id = "${module.vpc.subnet_id}"
}

module "vpc" {
         source = "./module/vpc"
}