# public EC2 instance
resource "aws_instance" "public_vm" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet
  key_name = var.key_name
  associate_public_ip_address = true
  security_groups = [var.security_group]

  tags = {
    "Name" = "Public-VM"
  }

  user_data = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install -y nginx
            sudo systemctl start nginx
            sudo systemctl enable nginx
            EOF
}

# private EC2 instance
resource "aws_instance" "private_vm" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id       = var.private_subnet
  key_name        = var.key_name
  security_groups = [var.security_group]

  tags = {
    Name = "Private-VM"
  }
  associate_public_ip_address = false
}