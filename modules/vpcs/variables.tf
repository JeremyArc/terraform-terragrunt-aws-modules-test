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

variable "vpc_private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
}
