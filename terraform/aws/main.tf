#add ec2 instance
resource "aws_instance" "webtier-1" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-1.id}"
  vpc_security_group_ids = ["${aws_security_group.web_app.id}"]
  key_name = "${var.keyname}"
  user_data = "${file("./aws/userdata")}"
  tags {
        Name = "webtier-1"
  }
}

#add second ec2 instance
resource "aws_instance" "webtier-2" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-2.id}"
  vpc_security_group_ids = ["${aws_security_group.web_app.id}"]
  key_name = "${var.keyname}"
  user_data = "${file("./aws/userdata")}"
  tags {
        Name = "webtier-2"
  }
}
