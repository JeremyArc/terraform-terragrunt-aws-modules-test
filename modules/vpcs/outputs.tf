output "vpc_1_id" {
  value = module.vpc1.vpc_id
}

output "vpc_2_id" {
  value = module.vpc2.vpc_id
}
output "vpc_1_private_subnet_ids" {
  value = module.vpc1.private_subnets
}
