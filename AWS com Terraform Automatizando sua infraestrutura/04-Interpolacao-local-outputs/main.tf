terraform {

  required_version = "0.14.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
    /**
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  */
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


