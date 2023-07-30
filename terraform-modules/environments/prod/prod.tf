module "ec2-dev" {
  source = "../../ec2"
  instance_type = "m5.large"
    tag_name = "production-terraform-practice"

  # ami_id = "ami-0d13e3e640877b0b9"
}