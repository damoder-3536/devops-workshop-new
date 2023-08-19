provider "aws"  {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  key_name = "demo"
  security_groups = [ "ssh access" ]
}

resource "aws_security_group" "ssh access" {
  name        = "ssh access"
  description = "ssh access"


  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh access"
  }
}