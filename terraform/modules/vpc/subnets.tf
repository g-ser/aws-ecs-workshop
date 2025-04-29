resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.base_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/27"
  map_public_ip_on_launch = true
  tags = {
    "aws-cdk:subnet-name" = "Public"
    "aws-cdk:subnet-type" = "Public"
    Name                  = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.base_vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.0.32/27"
  map_public_ip_on_launch = true
  tags = {
    "aws-cdk:subnet-name" = "Public"
    "aws-cdk:subnet-type" = "Public"
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id = aws_vpc.base_vpc.id
  availability_zone = "us-east-1c"
  cidr_block = "10.0.0.64/27"
  map_public_ip_on_launch = true
  tags = {
    "aws-cdk:subnet-name" = "Public"
    "aws-cdk:subnet-type" = "Public"
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet3"
  }
}