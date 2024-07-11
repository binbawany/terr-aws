variable "ami_id" {
  description = "AMI ID for the iis ec2"
}

variable "ec2_instance_id" {
  description = "AMI ID for the launch template"
}

variable "instance_type" {
  description = "Instance type for the launch configuration"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
}

variable "launch_template_sg" {
  description = "Security group ID for the launch configuration"
}

variable "elb_target_group_arn" {
  description = "Target group ARN for the ELB"
}
