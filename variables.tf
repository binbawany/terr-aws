variable "aws_region" {
  default = "us-east-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "ami_id" {
  default = "ami-04df9ee4d3dfde202"  # Windows AMI us-east-1 from console
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_name" {
  default = "mydatabase"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "password"
}

variable "zone_id" {
  default = "Z052423923DL3K9ONQNJF"
}

variable "domain_name" {
  default = "binbawany.com"
}
