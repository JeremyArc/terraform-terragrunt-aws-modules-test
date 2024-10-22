module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.7.0"

  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.username
  port     = var.port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window

  tags = var.tags

  major_engine_version = var.major_engine_version

  skip_final_snapshot = var.skip_final_snapshot

  create_db_subnet_group = var.create_db_subnet_group
  subnet_ids = var.subnet_ids
  db_subnet_group_name = var.db_subnet_group_name

  # DB parameter group
  family = var.family

  parameters = var.parameters

}