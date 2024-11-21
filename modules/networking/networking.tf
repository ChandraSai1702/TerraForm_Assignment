# custom VPC creation
resource "aws_vpc" "custom_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "custom-vpc"
    }
}

# public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

# private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet"
  }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.custom_vpc.id
    tags = {
      Name = "internet-gateway"
    }
}

# public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Associate Public Subnet with Route Table 
resource "aws_route_table_association" "public_rta" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group for SSH and HTTP (NGINX)
resource "aws_security_group" "nginx_sg" {
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}