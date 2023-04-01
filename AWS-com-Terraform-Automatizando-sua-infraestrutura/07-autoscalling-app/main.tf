terraform {
  required_version = "0.14.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
  backend "s3" {
    bucket         = "tfstate-387845387304"
    key            = "05-autoscaling-app/terraform.tfstate"
    region         = "eu-west-3"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
