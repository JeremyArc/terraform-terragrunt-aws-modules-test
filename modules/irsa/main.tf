# ------------------------------------------------------------------------------------------
# irsa module
# IAM Role for Service Accounts (IRSA) module
module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.39.1"

  role_name = "s3-readonly-irsa"

  role_policy_arns = {
    policy = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }

  oidc_providers = {
    one = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["default"]
    }
  }
}