resource "aws_db_instance" "api_db" {
  identifier             = "${lower(replace(var.name, " ", "-"))}-db"
  allocated_storage      = var.allocated_storage
  db_name                = var.name_db
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  parameter_group_name   = var.parameter_group_name
  password               = var.password
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = var.skip_final_snapshot
  port                   = var.port
  vpc_security_group_ids = [aws_security_group.sg-dev.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  depends_on = [
    aws_vpc.my_vpc,
    aws_db_subnet_group.db_subnet_group,
    aws_security_group.sg-dev
  ]

}
