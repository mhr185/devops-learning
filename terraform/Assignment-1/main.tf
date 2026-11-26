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

moved {
  from = aws_vpc.terraform_vpc
  to = module.network.aws_vpc.terraform_vpc
}

moved {
  from = aws_subnet.terraform_pub_subnet
  to = module.network.aws_subnet.terraform_pub_subnet
}

moved {
  from = aws_security_group.allow_http
  to = module.network.aws_security_group.allow_http
}

moved {
  from = aws_route_table.terraform_route_table
  to = module.network.aws_route_table.terraform_route_table
}

moved {
  from = aws_route_table_association.terraform_route_table_association
  to = module.network.aws_route_table_association.terraform_route_table_association
}
moved {
  from = aws_internet_gateway.terraform_gw
  to = module.network.aws_internet_gateway.terraform_gw
}
moved {
  from = aws_vpc_security_group_ingress_rule.allow_http_ipv4
  to = module.network.aws_vpc_security_group_ingress_rule.allow_http_ipv4
}
moved {
  from = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4
  to = module.network.aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4
}