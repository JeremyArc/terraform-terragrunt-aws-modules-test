# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
    bucket_name = "dev-jessada-s3-bucket"
    enable_versioning = {
      enabled = true
   }
    s3_tag = {
        Environment = "dev"
    }
}