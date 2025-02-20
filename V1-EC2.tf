provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0da4b082c0455e0a0"
  instance_type = "t2.micro"
}