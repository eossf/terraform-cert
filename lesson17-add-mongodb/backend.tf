terraform {
  backend "s3" {
    bucket = "s3tf-bucket"
    key    = "lesson17"
    region = "eu-west-3"
  }
}

provider "aws" {
    region = "eu-west-3"
}