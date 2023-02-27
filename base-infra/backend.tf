terraform {
  backend "s3" {
    bucket  = "plasmic-tfstate"
    key     = "plasmic-base-infra/base-infra-terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}