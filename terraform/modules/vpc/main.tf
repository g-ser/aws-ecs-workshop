resource "aws_vpc" "base_vpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "ecsworkshop-base/BaseVPC"
  }
}