#add ec2 instance for 4 docker
resource "aws_instance" "webtier-1" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-1.id}"
  vpc_security_group_ids = ["${aws_security_group.web_app.id}"]
  key_name = "${var.keyname}"
  user_data = "${file("./aws/userdata")}"
  tags {
        Name = "webtier"
  }
}

#add second ec2 instance for 4 docker
resource "aws_instance" "webtier-2" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-1.id}"
  vpc_security_group_ids = ["${aws_security_group.web_app.id}"]
  key_name = "${var.keyname}"
  user_data = "${file("./aws/userdata")}"
  tags {
        Name = "webtier-2"
  }
}
