resource "aws_instance" "wordpress" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_id
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