provider "aws" {
  region = "ap-south-1"
}

  resource "aws_instance" "my_ec2" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = "t2.micro"

  key_name = "jenkin"

  vpc_security_group_ids = [aws_security_group.website_sg.id]


    user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "new-web"
  }
}
resource "aws_security_group" "website_sg" {
  name_prefix = "website_sg_"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}