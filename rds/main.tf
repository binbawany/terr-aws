resource "aws_db_instance" "main" {
  identifier             = "my-rds-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  db_name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "my-rds-instance"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "main-subnet-group"
  }
}

