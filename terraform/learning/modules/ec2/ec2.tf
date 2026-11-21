resource "aws_instance" "this" {
  ami                     = "ami-04d9aef197720113b"
  instance_type           = var.instance_type

}
resource "aws_instance" "import" {
  ami                     = local.instance_ami
  instance_type           = var.instance_type
  tags = {
    Name = "terraform-import"
  }
}