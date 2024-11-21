provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "./modules/networking"
}

module "ssh" {
  source = "./modules/ssh"
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  public_subnet = module.networking.public_subnet_id
  private_subnet = module.networking.private_subnet_id
  security_group = module.networking.security_group_id
  key_name       = module.ssh.key_name
}