provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpc_main_dc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-main-dc"
  }
}

resource "aws_subnet" "subnet_main_dc_a" {
  vpc_id = aws_vpc.vpc_main_dc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_a
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-main-dc-a"
  }
}

resource "aws_internet_gateway" "internet_gateway_dc" {
  vpc_id = aws_vpc.vpc_main_dc.id
}

resource "aws_route_table" "route_table_dc" {
  vpc_id = aws_vpc.vpc_main_dc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_dc.id
  }
}