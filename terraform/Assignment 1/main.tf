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

resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Assignment 1 VPC"
  }
}

resource "aws_subnet" "terraform_pub_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "Assignment 1 Public Subnet"
  }
}

resource "aws_instance" "wordpress" {
  ami           = "ami-05855828e1e2be542"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.terraform_pub_subnet.id
  tags = {
    Name = "Assignment 1"
  }
}

