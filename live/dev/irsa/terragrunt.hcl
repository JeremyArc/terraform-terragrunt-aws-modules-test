dependency "eks" {
  config_path = "../eks"
}

# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/irsa"
}

inputs = {
 eks_oidc_provider_arn = dependency.eks.outputs.oidc_provider_arn
}