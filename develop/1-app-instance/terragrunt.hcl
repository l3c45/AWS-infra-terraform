terraform {
  source = "${path_relative_from_include()}/modules/ec2"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
name = "app"
instance_type = "t2.micro"
ami = "ami-0aeeebd8d2ab47354"
}
