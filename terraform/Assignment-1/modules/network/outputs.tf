output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "subnet_id" {
  value = aws_subnet.terraform_pub_subnet.id
}

output "security_group_id" {
  value = aws_security_group.allow_http.id
}                                                                                               