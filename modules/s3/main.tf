module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket = var.bucket_name
#   acl    = "private"

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

  versioning = var.enable_versioning

  tags = var.s3_tag
}