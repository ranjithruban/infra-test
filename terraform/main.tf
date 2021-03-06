terraform {
  backend "s3" {
    bucket = "state-file-s3"
    key    = "terraform-test-app.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "aws" {
	source	= "./aws"
}

module "docker"{
	source = "./docker"
	aws_ip = "${module.aws.vm_ip_1}"
}

module "docker1"{
      source = "./docker"
        aws_ip = "${module.aws.vm_ip_2}"
}
