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
  vpc_id     = aws_vpc.terraform_vpc.id
  depends_on = [aws_vpc.terraform_vpc]
  tags = {
    Name = "Assignment 1 Internet Gateway"
  }
}

resource "aws_route_table" "terraform_route_table" {
  vpc_id     = aws_vpc.terraform_vpc.id
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

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  tags = {
    Name = "allow_http_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = var.my_public_ip
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "terraform_ssm_role" {
  name               = "terraform_ssm_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.terraform_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "terraform_ssm_instance_profile" {
  name = "terraform_ssm_instance_profile"
  role = aws_iam_role.terraform_ssm_role.name
}

resource "aws_instance" "wordpress" {
  ami                         = "ami-05855828e1e2be542"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.terraform_pub_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  iam_instance_profile        = aws_iam_instance_profile.terraform_ssm_instance_profile.name
  associate_public_ip_address = true
user_data = templatefile("${path.module}/templates/user_data.sh.tftpl", {
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  db_root_password = var.db_root_password
})
user_data_replace_on_change = true
  tags = {
    Name = "Assignment 1"
  }
}

