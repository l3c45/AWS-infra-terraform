
resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    name = var.name
  }
}
