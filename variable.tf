variable "ec2_ami" {
  description = "This is a variable to manage ec2 AMI type"
  type        = string
  default     = "ami-0ed752ea0f62749af"
}

variable "VPC_value" {
  description = "This is a variable to manage the VPC"
  type        = string
  default     = "vpc-0de121ec0ecf8eeb6"
}

variable "ec2_key_name" {
  description = "This is a variable to manage ec2 key name"
  type        = string
  default     =  "test100" #"cloud1b"
}

variable "ec2_instance_type" {
  description = "This is a variable to manage ec2 instance type"
  type        = string
  default     = "t2.nano"
}

variable "certificate_arn" {
  description = "This variable will manage the HTPPS listener cert arn"
  type        = string
  default     = "arn:aws:acm:eu-west-1:622658514249:certificate/ca534fd3-96a8-494a-b182-6b71bad9696f"
}

variable "DB-engine" {
  description = "This variable will manage the name of the DB engine"
  type        = string
  default     = "postgres"
}

variable "DB-instance_class" {
  description = "This variable will manage the instance type for DB"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "This variable will manage the database version for DB set up"
  type        = string
  default     = "15.3"
}

variable "identifier" {
  description = "This variable will manage the database identifier for DB set up"
  type        = string
  default     = "hrapp-database"
}

# variable "bucket" {}
# variable "key" {}


# route:
#   receiver: 'slack'

# receivers:
#   - name: 'slack'
#     slack_configs:
#           - send_resolved: true
#             username: 'ruufman'
#             channel: 'sapphire-masterclass'
#             api_url: 'tech-trainingteam.slack.com'





























































































# variable "ec2_ami" {
#   description = "This is a variable to manage ec2 AMI type"
#   type        = string
#   default     = "ami-06935448000742e6b"
# }

# variable "ec2_instance_type" {
#   description = "This is a variable to manage ec2 instance type"
#   type        = string
#   default     = "t2.medium"
# }

# variable "ec2_key_name" {
#   description = "This is a variable to manage ec2 key name"
#   type        = string
#   default     = "test100"
# }

# #VPC Name
# variable "vpc_name" {
#   description = "This value is the VPC name"
#   type        = string
#   default     = "myvpc"
# }

# # CIDR Block
# variable "vpc_cidr_block" {
#   description = "This value is the given VPC vpc cidr block"
#   type        = string
#   default     = "10.0.0.0/16"
# }

# # Availability Zone
# variable "vpc_availability_zone" {
#   description = "This is the vpc availability zone"
#   type        = list(string)
#   default     = ["eu-west-1a", "eu-west-1b"]
# }

# # Public Subnet
# variable "vpc_public_subnet" {
#   description = "This variable hold the value for VPC Public Subnets"
#   type        = list(string)
#   default     = ["10.0.101.0/24", "10.0.102.0/24"]
# }

# # Private Subnet
# variable "vpc_private_subnet" {
#   description = "This variable hold the value for VPC Private Subnets"
#   type        = list(string)
#   default     = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# # Database Subnet
# variable "vpc_database_subnet" {
#   description = "This variable hold the value for VPC database Subnets"
#   type        = list(string)
#   default     = ["10.0.151.0/24", "10.0.152.0/24"]
# }

# # VPC tags
# variable "vpc_tags" {
#   description = "This variable hold the value for VPC tags"
#   type        = string
#   default     = "vpc-dev"
# }

# variable "default_values" {
#   description = "This variable hold the value for VPC tags"
#   default = {
#     Name     = "James Anderson"
#     Env      = "Staging"
#     Location = "New York"
#   }
# }

# variable "sg_tags" {
#   description = "This variable hold the value for security group tags"
#   type        = string
#   default     = "terraform-security-group"
# }
