dependency "vpcs" {
  config_path = "../vpcs"
}

# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/vpc-endpoints"
}

inputs = {
  vpc_id = dependency.vpcs.outputs.vpc_1_id

  s3_endpoint_tag = {
    Environment = "dev"
  }
  ec2_endpoint_tag = {
    Environment = "dev"
  }
  vpc_endpoint_tag = {
    Environment = "dev"
  }
}