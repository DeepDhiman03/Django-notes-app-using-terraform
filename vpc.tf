# Define the VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # Specifies the IP range for the VPC
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Define the first subnet in ap-south-1a
resource "aws_subnet" "public_subnet_1" {
  vpc_id                   = aws_vpc.main.id
  cidr_block               = "10.0.1.0/24"
  map_public_ip_on_launch  = true
  availability_zone        = "us-east-1a"
  tags = {
    Name = "public-subnet-1"
  }
}

# Define the second subnet in ap-south-1b
resource "aws_subnet" "public_subnet_2" {
  vpc_id                   = aws_vpc.main.id
  cidr_block               = "10.0.2.0/24"
  map_public_ip_on_launch  = true
  availability_zone        = "us-east-1b"
  tags = {
    Name = "public-subnet-2"
  }
}

# Create the internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-internet-gateway"
  }
}

# Define the route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Associate route table with subnets
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
