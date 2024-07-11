output "instance_ids" {
  value = aws_autoscaling_group.main.id
}

output "ami-id" {
  value = aws_ami_from_instance.ec2-ami.id
}