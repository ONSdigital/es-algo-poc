provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.26"
}

terraform {
  backend "s3" {
    bucket = "results-terraform-state"
    key = "es-algo-poc/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "results-terraform-locks"
    encrypt = true
  }
}