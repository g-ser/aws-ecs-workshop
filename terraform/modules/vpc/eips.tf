# Elastic IPs for NAT Gateways

resource "aws_eip" "public_subnet_1_eip" {
  vpc = true
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
}

resource "aws_eip" "public_subnet_2_eip" {
  vpc = true
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
}

resource "aws_eip" "public_subnet_3_eip" {
  vpc = true
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet3"
  }
}