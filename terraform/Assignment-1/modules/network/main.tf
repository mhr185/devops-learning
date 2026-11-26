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
