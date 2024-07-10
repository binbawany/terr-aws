variable "ami_id" {
  description = "AMI ID for the launch configuration"
}

variable "instance_type" {
  description = "Instance type for the launch configuration"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
}

variable "launch_configuration_sg" {
  description = "Security group ID for the launch configuration"
}

variable "elb_target_group_arn" {
  description = "Target group ARN for the ELB"
}
