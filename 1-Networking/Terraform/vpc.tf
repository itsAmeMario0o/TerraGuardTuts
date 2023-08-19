#############################
#
#       VPC Networking
#
#############################

# Step 1 - Create a Virtual Private Cloud, VPC
resource "aws_vpc" "vpc"{
    cidr_block = var.main_vpc_cidr
    tags = {
      name = "${var.project_name}-vpc"
    }
}

# Step 2 - Create a public subnet within the VPC
resource "aws_subnet" "public_subnet_az1"{
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnets
    tags = {
      name = "${var.project_name}-pubnet"
    }
}

# Step 3 - Create a private subnet within the VPC
resource "aws_subnet" "private_subnet_az1"{
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnets
    tags = {
      name = "${var.project_name}-privnet"
    }
}

# Step 4 - Create an "Internet Gateway"
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      name = "${var.project_name}-igw"
    }
}

# Step 5 - Create a "Route Table"
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
      name = "${var.project_name}-pubRT"
    }
}

# Step 6 - Create a default route and point towards the internet gateway
resource "aws_route" "DEFAULT_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Step 6 - Associate Route Table
resource "aws_route_table_association" "PubRTassociation"{
    subnet_id = aws_subnet.public_subnet_az1.id
    route_table_id = aws_route_table.public_rt.id
}