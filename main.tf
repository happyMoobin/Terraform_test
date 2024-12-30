resource "aws_instance" "example" {
  ami = "ami-042e76978adeb8c48"
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-example"
  }
}