module "ec2-dev" {
  source = "../../ec2"
  instance_type = "t2.micro"
  ami_id = "ami-06ca3ca175f37dd66"
  tag_name = "development-terraform-practice"
}