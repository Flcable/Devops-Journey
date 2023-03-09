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


resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-1231gdrd234557456fld42342342"
  acl    = "private"

  tags = {
    Name        = "My First Terraformbucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Flavio Cruz"
    Updatedat   = "2023-03-09"
  }
}