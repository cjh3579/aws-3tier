resource "aws_db_instance" "db" {
  engine         = "mysql"
  instance_class = var.db_instance_class
  allocated_storage = 20
  db_name       = var.db_name
  username     = var.db_username
  password     = var.db_password
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets
}

