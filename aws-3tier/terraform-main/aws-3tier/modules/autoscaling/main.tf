resource "aws_launch_template" "web" {
  name_prefix   = "web-lt"
  image_id      = "ami-037f2fa59e7cfbbbb"
  instance_type = "t3.micro"

  network_interfaces {
    security_groups = [var.web_sg_id]
  }
}

resource "aws_autoscaling_group" "web" {
  vpc_zone_identifier = var.private_subnets
  desired_capacity    = 2
  min_size           = 2
  max_size           = 3
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}

