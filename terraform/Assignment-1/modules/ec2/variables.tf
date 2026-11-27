variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
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

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the instance."
  type        = string
}

variable "instance_profile_id" {
  description = "The ID of the IAM instance profile to associate with the instance."
  type        = string
}