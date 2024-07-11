variable "public_subnets" {
    type = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "igw_id" {
  description = "ID of the Internet gateway"
}

variable "availability_zones" {
  type = map(string)
  default = {
    "10.0.1.0/24" = "us-east-1a"
    "10.0.2.0/24" = "us-east-1b"
  }
}
# variable "route_table_id" {
#   description = "ID of the route table"
# }