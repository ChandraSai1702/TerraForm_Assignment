resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.ssh.public_key_openssh

  lifecycle {
    prevent_destroy = false
  }
}
