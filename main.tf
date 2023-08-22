resource "aws_instance" "thehrapp" {
    ami                         = var.ec2_ami
    instance_type               = var.ec2_instance_type
    key_name                    = var.ec2_key_name
    
    tags = {
        value = "Hr_Applcation"
    } 
}
































































































# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "5.1.1"
# }

# name            = var.vpc_name
# cidr            = var.pc_cidr_block
# azs             = vpc.vpc_availability_zone
# private_subnets = var.vpc_private_subnet
# public_subnets  = var.vpc_public_subnet

# # Database Subnets
# create_database_subnet_group           = true
# create_database_subnet_route_table     = true
# create_database_internet_gateway_route = true
# database_subnets                       = var.vpc_database_subnet
# #create_database_nat_gateway_route = true


# # NAT Gateway for outbound communication
# enable_nat_gateway = true
# single_nat_gateway = true

# # VPC DNS Parameters
# enable_dns_hostnames = true
# enable_dns_support   = true

# public_subnet_tags = {
#   type = "public_subnets"
# }

# private_subnet_tags = {
#   type = "private_subnets"
# }

# database_subnet_tags = {
#   type = "database_subnets"
# }


# values = var.default_values

# # tags = {
# #    value = var.given_tags
# # owner           = "ruufman"
# # Environment     = "Development team"
# # Tutor           = "Shegoj_International"
# # Location        = "London"
# # Weekend_classes = "Yes"
# # }


# vpc_tags = var.vpc_tags


# # vpc_tags = {
# #   Name = var.vpc_tags
# # }


