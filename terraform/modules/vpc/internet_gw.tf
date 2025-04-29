resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.base_vpc.id
  tags = {
    Name = "ecsworkshop-base/BaseVPC"
  }
}
