variable "environment" {
  type = string

  description = ""

  default = "dev"
}


variable "aws_region" {
  type = string

  description = ""

  default = "eu-west-3"
}

variable "aws_profile" {
  type = string

  description = ""

  default = "default"
}




/*
variable "instance_ami" {
  type        = string
  
  description = ""
}

variable "instance_type" {
  type        = string
  
  description = ""
}

variable "instance_tags" {
  type = map(string)

  description = ""

  default = {
    Name    = "Ubuntu"
    Project = "Curso AWS com Terraform"
  }
}
*/
