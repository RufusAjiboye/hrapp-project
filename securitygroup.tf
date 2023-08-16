resource "aws_security_group" "myhrapp_sg" {
  name        = "hrapp_security_group"
  description = "Allow SSH and HTTP Connection"
  vpc_id      = var.my-vpc

  ingress {
    description = "Allow inbound and outbound connection"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound and outbound connection"
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

  tags = {
    Name = "HrApp"
  }
}