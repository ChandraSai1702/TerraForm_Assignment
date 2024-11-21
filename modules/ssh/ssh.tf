resource "aws_key_pair" "ec2_key" {
  key_name = "ec2-key"
  # public_key = file("/home/sigmoid/Downloads/todo_ec2.pub")
  public_key = file("~/.ssh/id_rsa.pub")
}