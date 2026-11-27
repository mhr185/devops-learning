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

module "iam" {
  source = "./modules/iam"
}

resource "aws_instance" "wordpress" {
  ami                         = "ami-05855828e1e2be542"
  instance_type               = var.instance_type
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  iam_instance_profile        = module.iam.instance_profile_id
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

