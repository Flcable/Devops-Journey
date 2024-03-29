terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }



  backend "s3" {
    bucket = "tfstate-387845387304"
    key    = "05-workspaces/terraform.tfstate"
    region = "eu-west-3"
    dynamodb_table = "tflock-tfstate-387845387304"

  }
}

provider "aws" {
  region = lookup(var.aws_region, local.env)
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}