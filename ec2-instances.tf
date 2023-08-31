resource "aws_instance" "appnode" {

  count         = 2
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name
  subnet_id = aws_subnet.subnet_public1.id
  vpc_security_group_ids = [aws_security_group.myhrapp_sg.id] 
  associate_public_ip_address = true

  tags = {
    Name = "HrApp_Server"
  }
}

















# resource "aws_instance" "appnode" {

#   count         = 3
#   ami           = var.ec2_ami
#   instance_type = var.ec2_instance_type
#   key_name      = var.ec2_key_name

#   tags = {
#     Name = "HrApp_Server"
#   }
# }

















