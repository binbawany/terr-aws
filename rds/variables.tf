variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
}

variable "db_sg_id" {
  description = "Security group ID for the RDS instance"
}
