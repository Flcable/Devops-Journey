terraform {

  required_version = "0.14.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}
provider "aws" {
  region = "eu-west-3"
}


data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

    tags = {
        Description = "Stores Terraformremote files"
        ManagedBy   = "Terraform"
        Owner       = "Flavio Cruz"
        CreatedAt   = "2023-03-10"

    
}
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}

