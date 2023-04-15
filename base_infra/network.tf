#Create VPC in eu-west-1
resource "aws_vpc" "vpc_main" {
  # provider             = aws.region-main
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }

}

#Create IGW in eu-west-1
resource "aws_internet_gateway" "igw" {
  # provider = aws.region-main
  vpc_id = aws_vpc.vpc_main.id
}

#Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  # provider = aws.region-main
  state = "available"
}


#Create subnet #1 in eu-west-1
resource "aws_subnet" "jenkins-subnet" {
  # provider          = aws.region-main
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = "10.0.1.0/24"
}


#Create subnet #2 in eu-west-1
resource "aws_subnet" "app-subnet" {
  # provider          = aws.region-main
  vpc_id            = aws_vpc.vpc_main.id
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  cidr_block        = "10.0.2.0/24"
}

#Create route table in eu-west-1
resource "aws_route_table" "internet_route" {
  # provider = aws.region-main
  vpc_id = aws_vpc.vpc_main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  lifecycle {
    ignore_changes = all
  }
  tags = {
    Name = "Public-Subnet-RT"
  }
}

#Overwrite default route table of VPC(Master) with our route table entries
resource "aws_main_route_table_association" "set-public-subnet-route-table" {
  vpc_id         = aws_vpc.vpc_main.id
  route_table_id = aws_route_table.internet_route.id
}
