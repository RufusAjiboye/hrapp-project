resource "aws_subnet" "subnet_public1" {
  vpc_id            = aws_vpc.localvpc.id
  cidr_block        = "100.73.0.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Main1"
  }
}

resource "aws_subnet" "subnet_public2" {
  vpc_id            = aws_vpc.localvpc.id
  cidr_block        = "100.68.32.0/24"
  availability_zone = "eu-west-1b"


  tags = {
    Name = "Main2"
  }
}

resource "aws_vpc" "localvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dvpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.localvpc.id

  tags = {
    Name = "IGW"
  }

}

resource "aws_route_table" "awsrt" {
  vpc_id = aws_vpc.localvpc.id

  tags = {
    Name = "RouteTable"
  }
}

resource "aws_route_table_association" "positive_rta1" {
  subnet_id      = aws_subnet.subnet_public1.id
  route_table_id = aws_route_table.awsrt.id
}


resource "aws_route_table_association" "positive_rta2" {
  subnet_id      = aws_subnet.subnet_public2.id
  route_table_id = aws_route_table.awsrt.id
}


resource "aws_route" "awsroute" {
  route_table_id         = aws_route_table.awsrt.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_eip" "elastic_ip_nat_gateway" {
  vpc                       = true
  associate_with_private_ip = "10.0.0.10"

  tags = {
    name = "hr-app"
  }
}

#########private network#########
# resource "aws_subnet" "subnet_private1" {
#   vpc_id            = var.my-vpc
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "eu-west-1a"

#   tags = {
#     Name = "Main1"
#   }
# }

# resource "aws_subnet" "subnet_private2" {
#   vpc_id            = var.my-vpc
#   cidr_block        = "10.0.4.0/24"
#   availability_zone = "eu-west-1b"

#   tags = {
#     Name = "Main2"
#   }
# }

# resource "aws_route_table" "negative_awsrt" {
#   vpc_id = var.my-vpc

#   tags = {
#     Name = "RouteTable"
#   }
# }

# resource "aws_route_table_association" "negative_rta3" {
#   subnet_id      = aws_subnet.subnet_private1.id
#   route_table_id = aws_route_table.negative_awsrt.id
# }


# resource "aws_route_table_association" "negative_rta4" {
#   subnet_id      = aws_subnet.subnet_private2.id
#   route_table_id = aws_route_table.negative_awsrt.id
# }