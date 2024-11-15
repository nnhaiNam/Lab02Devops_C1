#VPC
resource "aws_vpc" "main_vpc" {
    cidr_block = var.cidr_block  
    enable_dns_support   = true
    enable_dns_hostnames = true
    
    
    tags = {
        Name=var.vpc_name
    }

}

#Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet "
  }
}

#Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-private-subnet "
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}


#Default Security Group for VPC
# checkov:skip=CKV2_AWS_5: Security Group attached to resource in separate module
resource "aws_security_group" "default" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "default_sg"
  description = "Default Security Group for VPC"

  # Cho phép tất cả lưu lượng nội bộ trong VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.main_vpc.cidr_block]
    description = "All traffic in VPC"
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
     description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.vpc_name}-default-sg"
  }
}


