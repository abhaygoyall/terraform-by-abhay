provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-0fb653ca2d3203ac1"
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "terraform-example"
  }
  user_data = <<-EOF
#!/bin/bash
echo "Hello, World" > index.xhtml
nohup busybox httpd -f -p ${var.server_port} &
EOF
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance-sg"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}