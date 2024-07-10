variable "vpc_id" {
  description = "ID of the VPC"
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
}
