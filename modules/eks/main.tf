module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  cluster_addons = var.cluster_addons

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  eks_managed_node_groups = var.eks_managed_node_groups

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions


  tags = var.tags
}

module "karpenter" {
  source = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "20.15.0"

  cluster_name = module.eks.cluster_name

  create_node_iam_role = var.create_node_iam_role
  node_iam_role_arn    = module.eks.eks_managed_node_groups["node_group"].iam_role_arn

#   node_iam_role_arn    = module.iam_assumable_role_with_oidc.role_arn

  create_access_entry = var.create_access_entry

  tags = var.karpenter_tags
}

