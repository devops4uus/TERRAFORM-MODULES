resource "aws_instance" "my-instance" {
  ami           = "ami-036490d46656c4818"
  
  instance_type = "t2.micro"
}
