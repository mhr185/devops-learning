variable "my_public_ip" {
  description = "The public IP address of the user."
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
  default     = "ami-05855828e1e2be542"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
  default     = "t3.micro"
}

variable "db_name" {
  description = "WordPress database name"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "WordPress database user"
  type        = string
  default     = "wpuser"
}

variable "db_password" {
  description = "WordPress database user password"
  type        = string
  sensitive   = true
}

variable "db_root_password" {
  description = "MariaDB root password"
  type        = string
  sensitive   = true
}

variable "wp_admin_user" {
  description = "WordPress admin user"
  type        = string
  default     = "wpcli"
}

variable "wp_admin_password" {
  description = "WordPress admin password"
  type        = string
  sensitive   = true
}

variable "wp_admin_email" {
  description = "WordPress admin email"
  type        = string
  sensitive   = true
}