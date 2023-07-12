locals {
  global = read_terragrunt_config(find_in_parent_folders("global.hcl"))
}
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "${local.global.locals.namespace}-${local.global.locals.stage}-terraform"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.global.locals.default_region
    dynamodb_table = "${local.global.locals.namespace}-${local.global.locals.stage}-terraform"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
