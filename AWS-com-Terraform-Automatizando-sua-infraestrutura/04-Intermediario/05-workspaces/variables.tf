variable "aws_region" {
  description = "AWS Region where the resources will be created"

  type = object({
    dev = string
    prod = string
  })

  default = {
    dev = "eu-west-3"
    prod = "us-east-1"
  }
}

variable "instance" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-017d9f576d1635a77"
      type   = "t2.micro"
      number = 1
    }
    prod = {
      ami    = "ami-00c39f71452c08778"
      type   = "t2.medium"
      number = 3
    }
  }
}