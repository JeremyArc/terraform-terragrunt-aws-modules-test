locals {
  # regex() with expression will receive user's current directory path from get_terragrunt_dir()
  # any path that are in "live/*" will be considered in this expression
  # ?P<env>.*? this is a "Capturing Group" it will pass a matched string into variable named "env"
  # ".*?" will try to match the least string (it will stop at "/" symbol)
  parsed = regex(".*/live/(?P<env>.*?)/.*", get_terragrunt_dir())
  env    = local.parsed.env
}
# Configure S3 as a backend
remote_state {
  backend = "s3"
  config = {
    bucket = "${local.env}-jessada-terragrunt-state"
    region = "ap-southeast-1"
    key    = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
