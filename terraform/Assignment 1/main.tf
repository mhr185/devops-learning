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

resource "aws_internet_gateway" "terraform_gw" {
  vpc_id = aws_vpc.terraform_vpc.id
  depends_on = [aws_vpc.terraform_vpc]
  tags = {
    Name = "Assignment 1 Internet Gateway"
  }
}

resource "aws_route_table" "terraform_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id
  depends_on = [aws_internet_gateway.terraform_gw]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_gw.id
  }

  tags = {
    Name = "Assignment 1 Route Table"
  }
}


resource "aws_subnet" "terraform_pub_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "Assignment 1 Public Subnet"
  }
}

resource "aws_route_table_association" "terraform_route_table_association" {
  subnet_id      = aws_subnet.terraform_pub_subnet.id
  route_table_id = aws_route_table.terraform_route_table.id
}


resource "aws_instance" "wordpress" {
  ami           = "ami-05855828e1e2be542"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.terraform_pub_subnet.id
  tags = {
    Name = "Assignment 1"
  }
  depends_on = [aws_internet_gateway.terraform_gw]
}

