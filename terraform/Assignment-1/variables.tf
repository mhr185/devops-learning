variable "my_public_ip" {
  description = "The public IP address of the user."
  type        = string
  sensitive   = true
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