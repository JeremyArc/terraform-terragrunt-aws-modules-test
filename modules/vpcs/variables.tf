variable "vpc_1_name" {
  description = "Name of the VPC 1"
  type        = string
}

variable "vpc_2_name" {
  description = "Name of the VPC 2"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_azs" {
  description = "Availability Zones for the VPC"
  type        = list(string)
}

variable "vpc_1_private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "vpc_2_public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "vpc_2_private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "vpc_1_public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
}


variable "enable_vpc1_nat_gateway" {
  description = "Enable NAT gteway on public subnet within VPC1, set to true to enable"
  type = bool
}
variable "vpc1_single_nat_gateway" {
  description = "Enable NAT gteway on public subnet within VPC1, set to false to create NAT persubnet"
  type = bool
}
variable "vpc1_one_nat_gateway_per_az" {
  description = "Enable NAT gteway on public subnet within VPC1, set to false to create NAT persubnet"
  type = bool
}

