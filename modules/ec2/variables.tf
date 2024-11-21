variable "ami" {
  description = "This is the AMI id for EC2 instances"
  type = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "This is the key name for the EC2 instance"
  type = string
}

variable "security_group" {
  description = "This is the security group for the EC2 instance"
  type = string
}

variable "public_subnet" {
  description = "This is the public subnet "
  type = string
}

variable "private_subnet" {
  description = "This is the private subnet"
  type = string
}
