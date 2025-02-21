provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0da4b082c0455e0a0"
  instance_type = "t2.micro"
  key_name = "DevOps"
  security_groups = ["allow_ssh"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}