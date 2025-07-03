terraform {
  backend "s3" {
    bucket = "tejadevsecopsb81 "
    key    = "ecr/terraform.tfstate"
    region = "us-east-1"
  }
}