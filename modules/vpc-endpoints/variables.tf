
variable "vpc_id" {
  description = "Any VPC's id you want to create endpoints"
  type        = string
}

variable "s3_endpoint_tag" {
  description = "Tags for the VPC s3 endpoint"
  type        = map(string)
}

variable "ec2_endpoint_tag" {
  description = "Tags for the VPC ec2 endpoint"
  type        = map(string)
}

variable "vpc_endpoint_tag" {
  description = "Tags for the VPC s3 endpoint"
  type        = map(string)
}
