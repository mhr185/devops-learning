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