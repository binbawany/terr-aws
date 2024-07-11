resource "aws_ami_from_instance" "ec2-ami" {
  name               = "iis-ami"
  source_instance_id = var.ec2_instance_id
}

resource "aws_launch_template" "iis-LT" {       
  name                   = "iis-LT"
  image_id               = aws_ami_from_instance.ec2-ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.launch_template_sg]
  tags = {
    Name = "iis-LT"
  }
}

# resource "aws_launch_configuration" "main" {
#   name          = "my-launch-config"
#   image_id      = aws_ami_from_instance.ec2-ami.id
#   instance_type = var.instance_type
#   security_groups = [var.launch_configuration_sg]
# }

resource "aws_autoscaling_group" "main" {
  launch_configuration = aws_launch_template.iis-LT.id
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
