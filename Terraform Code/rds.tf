
resource "aws_db_subnet_group" "rds" {
  name       = "gogreen-subnet-group"
  subnet_ids = aws_subnet.aws_gogreen_private_subnets_rds[*].id

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "m6g2xl.large"
  username               = "admin"
  password               = "P@ssword1234"
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.sg_db_tier.id]
  skip_final_snapshot    = true
  storage_type           = "gp3"
}