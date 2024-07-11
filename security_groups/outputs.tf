output "elb_sg_id" {
  value = aws_security_group.elb_sg.id
}

output "asg_sg_id" {
  value = aws_security_group.asg_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}