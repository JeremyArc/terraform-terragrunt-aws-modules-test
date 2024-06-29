module "vpc1" {
  source  = "terraform-aws-modules/vpc/aws"
    version = "5.8.1"

    name = var.vpc_1_name
    cidr = var.vpc_cidr
    azs             = var.vpc_azs
    private_subnets = var.vpc_1_private_subnets
    public_subnets  = var.vpc_1_public_subnets

    tags = var.vpc_tags
}


module "vpc2" {
  source  = "terraform-aws-modules/vpc/aws"
    version = "5.8.1"

    name = var.vpc_2_name
    cidr = var.vpc_cidr
    azs             = var.vpc_azs
    private_subnets = var.vpc_2_private_subnets
    public_subnets  = var.vpc_2_public_subnets

    tags = var.vpc_tags
}

