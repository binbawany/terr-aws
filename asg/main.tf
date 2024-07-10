resource "aws_launch_configuration" "main" {
  name          = "my-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = [var.launch_configuration_sg]
  user_data     = file("install_iis.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  launch_configuration = aws_launch_configuration.main.id
  min_size              = 2
  max_size              = 2
  desired_capacity      = 2
  vpc_zone_identifier   = var.private_subnets
  target_group_arns     = [var.elb_target_group_arn]
  # tag = {
  #   key                 = "Name",
  #   value               = "web-server",
  #   propagate_at_launch = true
  # }
}
