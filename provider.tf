provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "locust-terraform-s3"
    key    = "locust.tfstate"
    region = "ap-northeast-1"
  }
}
