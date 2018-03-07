resource "aws_security_group" "web_app" { 
  name = "web_app"
  tags {
        Name = "web_app"
  }
  description = "inbound http port"
  vpc_id = "${aws_vpc.vpc-main.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "2375"
    to_port     = "2375"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "8003"
    to_port = "8003"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
