resource "aws_instance" "appnode" {

  count         = 3
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name

  tags = {
    Name = "HrApp_Server"
  }
}
