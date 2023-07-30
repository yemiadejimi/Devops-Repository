terraform {
  backend "s3" {
    bucket = "terraform-state-devops-450"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb-terraform"
  }
}