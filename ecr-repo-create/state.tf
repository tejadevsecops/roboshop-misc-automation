terraform {
  backend "s3" {
    bucket = "tfstate-devsecops-b81"
    key    = "ecr/terraform.tfstate"
    region = "us-east-1"
  }
}