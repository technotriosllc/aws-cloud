provider "aws" {
  region  = var.region
}

terraform {
  required_providers {
    aws = {
      version = ">= 3.73.0"
    }
  }
  required_version = ">= 0.1.0"
}