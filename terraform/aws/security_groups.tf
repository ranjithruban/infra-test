resource "aws_security_group" "web_app" { 
  name = "web_app"
  tags {
        Name = "web_app"
  }
  description = "inbound http port"
  vpc_id = "${aws_vpc.vpc-main.id}"

#  ingress {
#    from_port   = "22"
#    to_port     = "22"
#    protocol    = "TCP"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  ingress {
#    from_port   = "1234"
#    to_port     = "1234"
#    protocol    = "TCP"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  ingress {
#    from_port = "9000"
#    to_port = "9000"
#    protocol = "TCP"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
  
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
