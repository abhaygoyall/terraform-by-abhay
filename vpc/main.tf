provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "public_2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/25"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-public-subnet-1"
  }
}

resource "aws_subnet" "public_2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.128/25"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-public-subnet-2"
  }
}

resource "aws_subnet" "private_2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/25"
  availability_zone = "us-east-2a"
  tags = {
    Name = "terraform-private-subnet-1"
  }
}

resource "aws_subnet" "private_2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.128/25"
  availability_zone = "us-east-2b"
  tags = {
    Name = "terraform-private-subnet-2"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "terraform-public-rt"
  }
}
resource "aws_route_table_association" "public_2a" {
  subnet_id      = aws_subnet.public_2a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_2b" {
  subnet_id      = aws_subnet.public_2b.id
  route_table_id = aws_route_table.public.id
}

