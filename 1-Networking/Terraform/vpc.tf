#############################
#
#       VPC Networking
#
#############################

# Step 1 - Create a Virtual Private Cloud, VPC
resource "aws_vpc" "SecureVPC"{
    cidr_block = var.main_vpc_cidr
    tags = {
      name = "SecureVPC"
    }
}

# Step 2 - Create a public subnet within the VPC
resource "aws_subnet" "PublicNetwork"{
    vpc_id = aws_vpc.SecureVPC.id
    cidr_block = var.public_subnets
}

# Step 3 - Create a private subnet within the VPC
resource "aws_subnet" "PrivateNetwork"{
    vpc_id = aws_vpc.SecureVPC.id
    cidr_block = var.private_subnets
}

# Step 4 - Create an "Internet Gateway"
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.SecureVPC.id
}

# Step 5 - Create a "Route Table"
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.SecureVPC.id
}

# Step 6 - Create a default route and point towards the IGW
resource "aws_route" "DEFAULT_route" {
  route_table_id         = aws_route_table.PublicRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id
}

# Step 6 - Associate Route Table
resource "aws_route_table_association" "PubRTassociation"{
    subnet_id = aws_subnet.PublicNetwork.id
    route_table_id = aws_route_table.PublicRT.id
}