variable "ami" {
  description = "AMI ID for ec2 instances"
  type = string
  default = "ami-06b21ccaeff8cd686"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type = string
  default = "t2.micro"
}