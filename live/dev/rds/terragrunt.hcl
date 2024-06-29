dependency "vpcs" {
  config_path = "../vpcs"
}

# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/rds"
}

inputs = {
   engine = "mysql"
   identifier = "demodb"
   engine_version = "5.7"
   instance_class = "db.t3.micro"
   allocated_storage = 5
   db_name = "demodb"
   username = "user"
   port = "3306"
   iam_database_authentication_enabled: false
   monitoring_interval = "30"
   maintenance_window = "Mon:00:00-Mon:03:00"
   backup_window = "03:00-06:00"
   tags = {
       Environment = "dev"
   }
  create_db_subnet_group = true

  subnet_ids = dependency.vpcs.outputs.vpc_1_private_subnet_ids

  db_subnet_group_name = "jessada-mysql-db-subnet-group"
  family = "mysql5.7"
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}