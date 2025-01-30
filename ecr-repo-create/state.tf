terraform {
  backend "s3" {
    bucket = "terraformstate-devsecops-b81"
    key    = "ecr/terraform.tfstate"
    region = "us-east-1"
  }
}