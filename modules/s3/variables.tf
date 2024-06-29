variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "enable_versioning" {
  description = "Turn on bucket version or not"
  type        = map(bool)
}

variable "s3_tag" {
  description = "Tags for the VPC s3 bucket"
  type        = map(string)
}