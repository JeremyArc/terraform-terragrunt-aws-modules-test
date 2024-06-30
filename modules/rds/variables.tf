# General Configuration
variable "engine" {
  description = "The database engine type (e.g., mysql, postgres)"
  type = string
}

variable "identifier" {
  description = "The database engine type (e.g., mysql, postgres)"
  type = string
}

variable "engine_version" {
  description = "The specific version of the database engine (e.g., 5.7, 14)"
  type = string
}

variable "instance_class" {
  description = "The instance class for the RDS database (e.g., db.t3a.large)"
  type = string
}

variable "allocated_storage" {
  description = "The amount of storage allocated to the database (e.g., 5)"
  type = number
}

# Database Credentials
variable "db_name" {
  description = "The name of the database"
  type = string
}

variable "username" {
  description = "The username for database access"
  type = string
}

variable "port" {
  description = "The port number for database access (default: 3306)"
  type = string
}

variable "create_db_subnet_group" {
  description = "Create a subnet group or not."
  type = bool
}

variable "subnet_ids" {
  description = "The list of subnet"
  type = list(string)
}

variable "db_subnet_group_name" {
  description = "A subnet group name (DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC)"
}

# Security and Monitoring
variable "iam_database_authentication_enabled" {
  description = "Whether to enable IAM database authentication (default: true)"
  type = bool
}

variable "monitoring_interval" {
  description = "The interval for enhanced monitoring (e.g., 30, in minutes)"
  type = string
}
variable "skip_final_snapshot" {
  type = bool
}

variable "maintenance_window" {
  description = "A time period to start maintenance window"
  type = string
}

variable "backup_window" {
  description = "A ltime period to start backup data"
  type = string
}

variable "tags" {
  description = "A list of VPC security group IDs for the database"
  type = map(string)
}

variable "major_engine_version" {
  description = "Major engine version for the database"
  type = string
}


# Database Parameters and Options
variable "family" {
  description = "The database parameter group family (e.g., mysql5.7)"
  type = string
}

# Potential additional variable for parameters block (if needed)
variable "parameters" {
  description = "Additional database parameters (key-value pairs)"
  type = list(object({
    name  = string
    value = string
  }))
}


