variable "ec2_sg_id" {
  description = "Security group ID for the ecs instance"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
}
