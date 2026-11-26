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

module "network" {
  source       = "./modules/network"
  my_public_ip = var.my_public_ip
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
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  iam_instance_profile        = aws_iam_instance_profile.terraform_ssm_instance_profile.name
  associate_public_ip_address = true
user_data = templatefile("${path.module}/templates/user_data.sh.tftpl", {
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  db_root_password = var.db_root_password
  wp_admin_user    = var.wp_admin_user
  wp_admin_password = var.wp_admin_password
  wp_admin_email   = var.wp_admin_email
})
user_data_replace_on_change = true
  tags = {
    Name = "Assignment 1"
  }
}
