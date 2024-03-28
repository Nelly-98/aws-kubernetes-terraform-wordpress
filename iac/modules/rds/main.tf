resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true # Pour éviter de créer un snapshot final à la suppression
  storage_encrypted   = true
  tags = {
    Name = "${var.project_name}-rds"
  }
}
