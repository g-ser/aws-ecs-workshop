# Route Tables and Associations

resource "aws_route_table" "public_subnet_1_rt" {
  vpc_id = aws_vpc.base_vpc.id
  tags = {
    Name = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
}

resource "aws_route_table_association" "public_subnet_1_rta" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_subnet_1_rt.id
}

resource "aws_route" "public_subnet_1_route" {
  route_table_id = aws_route_table.public_subnet_1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

# Repeat similar blocks for public_subnet_2 and public_subnet_3...







# Security Group

resource "aws_security_group" "frontend_to_backend_sg" {
  name = "FrontendToBackendSecurityGroup"
  description = "Security group for frontend service to talk to backend services"
  vpc_id = aws_vpc.base_vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# IAM Role for EC2 Instance

resource "aws_iam_role" "instance_ssm_role" {

  name = "InstanceSSMRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  ]
}


resource "aws_iam_instance_profile" "instance_profile" {
  name = "InstanceProfile"
  role = aws_iam_role.instance_ssm_role.name
}

# EC2 Instance

resource "aws_instance" "stress_tool_instance" {
  ami                  = data.aws_ssm_parameter.amzn2_ami.value
  instance_type        = "t3.medium"
  subnet_id            = aws_subnet.public_subnet_1.id
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name = "ecsworkshop-base-stresstool"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum-config-manager --enable epel
    sudo yum install -y siege
  EOF
}

data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}