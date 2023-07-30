terraform {
  backend "s3" {
    bucket = "terraform-practice-jimi"
    key    = "terraform/production/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "dynamodb-terraform"
  }
}