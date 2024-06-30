dependency "vpcs" {
  config_path = "../vpcs"
}

# Automatically find the root terragrunt.hcl and inherit its configuration
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/eks"
}

inputs = {
  cluster_name = "eks-cluster-with-irsa"
  cluster_version = "1.30"
  cluster_endpoint_public_access = true
  cluster_addons = {
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id = dependency.vpcs.outputs.vpc_1_id
  subnet_ids = dependency.vpcs.outputs.vpc_1_private_subnet_ids
  control_plane_subnet_ids = dependency.vpcs.outputs.vpc_1_private_subnet_ids

  eks_managed_node_group_defaults = {
    instance_types = ["t3.micro"]
  }
  eks_managed_node_groups = {
    node_group = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.micro"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    }
  }
  enable_cluster_creator_admin_permissions = true
  tags = {
    Environment = "dev"
  }
  create_node_iam_role = false
  create_access_entry = false

  karpenter_tags = {
    Environment = "dev"
  }
}