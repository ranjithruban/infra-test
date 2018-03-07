resource "aws_vpc" "vpc-main" {
    cidr_block = "${var.vpc-cidr}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "app vpc"
    }
}
