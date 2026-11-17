resource "aws_instance" "this" {
  ami                     = "ami-04d9aef197720113b"
  instance_type           = var.instance_type

}
resource "aws_instance" "import" {
  ami                     = "ami-0639df93102b03fec"
  instance_type           = var.instance_type
  tags = {
    Name = "terraform-import"
  }
}