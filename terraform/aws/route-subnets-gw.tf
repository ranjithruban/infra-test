#add internet gw 
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc-main.id}"

  tags {
    Name = "main gw"
  }
}

#add subnet 1
resource "aws_subnet" "main-1" {
  vpc_id     = "${aws_vpc.vpc-main.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags {
    Name = "subnet-1"
  }
}

#add subnet 2
resource "aws_subnet" "main-2" {
  vpc_id     = "${aws_vpc.vpc-main.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags {
    Name = "subnet-2"
  }
}

#add routing table to attach gw
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc-main.id}"
  tags {
      Name = "public and local route"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

#attach default 
resource "aws_main_route_table_association" "route_table" {
vpc_id = "${aws_vpc.vpc-main.id}"
route_table_id = "${aws_route_table.public.id}"
}
