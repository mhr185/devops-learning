variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
}

output "instance_id" {
    description = "The ID of the EC2 instance"
    value = aws_instance.import.id
}