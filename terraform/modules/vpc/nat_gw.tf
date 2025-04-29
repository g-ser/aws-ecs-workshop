# NAT Gateways

resource "aws_nat_gateway" "public_subnet_1_nat" {
  allocation_id = aws_eip.public_subnet_1_eip.id
  subnet_id = aws_subnet.public_subnet_1.id
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
}

resource "aws_nat_gateway" "public_subnet_2_nat" {
  allocation_id = aws_eip.public_subnet_2_eip.id
  subnet_id = aws_subnet.public_subnet_2.id
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
}

resource "aws_nat_gateway" "public_subnet_3_nat" {
  allocation_id = aws_eip.public_subnet_3_eip.id
  subnet_id = aws_subnet.public_subnet_3.id
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet3"
  }
}