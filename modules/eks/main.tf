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

  # Gives Terraform identity admin access to cluster which will
  # allow deploying resources (Karpenter) into the cluster
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions


  tags = var.tags
}

# Karpenter will manage the right size node for the actual resources needed for the pod
# https://karpenter.sh/
# module example: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/examples/karpenter/main.tf
# to validate Karpenter if it work properly: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/examples/karpenter/README.md

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

