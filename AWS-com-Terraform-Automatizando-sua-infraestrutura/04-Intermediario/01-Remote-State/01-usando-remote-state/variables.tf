variable "aws_region" {
  type        = string
  description = ""
  default     = "eu-west-3"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-017d9f576d1635a77"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}