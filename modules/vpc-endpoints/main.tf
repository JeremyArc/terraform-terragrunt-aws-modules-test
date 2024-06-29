module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.8.1"

  vpc_id             = var.vpc_id

  endpoints = {
    s3 = {
      # interface endpoint
      service             = "s3"
      tags                = var.s3_endpoint_tag
    },
    ec2 = {
      service             = "ec2"
      tags                = var.ec2_endpoint_tag
    },
  }

  tags = var.vpc_endpoint_tag
}