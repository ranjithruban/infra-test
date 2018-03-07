# Create a new application load balancer
resource "aws_lb" "webtier_alb" {
  name            = "webtier-lb-tf"
  internal        = false
  security_groups = ["${aws_security_group.web_app.id}"]
  subnets         = ["${aws_subnet.main-1.id}","${aws_subnet.main-2.id}"] 

  tags {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "webtier-lb-tg"
  port     = 8003
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.vpc-main.id}"
  health_check {
    interval            = "30"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    matcher             = "200-499"
  }
}

resource "aws_lb_target_group_attachment" "vm1" {
  target_group_arn = "${aws_lb_target_group.tg.arn}"
  target_id        = "${aws_instance.webtier-1.id}"
  port             = 8003
}

resource "aws_lb_target_group_attachment" "vm2" {
  target_group_arn = "${aws_lb_target_group.tg.arn}"
  target_id        = "${aws_instance.webtier-2.id}"
  port             = 8003
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.webtier_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.tg.arn}"
    type             = "forward"
  }
}
