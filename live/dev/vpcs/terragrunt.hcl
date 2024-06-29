# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/vpcs"
}

inputs = {
  vpc_1_name = "dev-vpc-1"
  vpc_2_name = "dev-vpc-2"
  vpc_cidr = "10.0.0.0/16"
  vpc_azs = ["ap-southeast-1a", "ap-southeast-1b",]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  vpc_tags = {
    Environment = "dev"
  }
}