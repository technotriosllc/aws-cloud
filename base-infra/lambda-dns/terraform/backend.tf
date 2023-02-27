terraform {
  backend "s3" {
    bucket = "plasmic-tfstate"
    key    = "dns-update-lambda-function/default.tfstate"
    region = "us-west-2"
  }
}