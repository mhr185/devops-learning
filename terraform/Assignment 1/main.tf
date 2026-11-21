terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "wordpress" {
  ami           = "ami-05855828e1e2be542"
  instance_type = "t3.micro"

  tags = {
    Name = "Assignment 1"
  }
}