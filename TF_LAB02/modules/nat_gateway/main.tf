resource "aws_eip" "nat" {
    domain = "vpc"
    tags = {
        Name = "EIP of NAT Gateway"
    }
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat.id
    subnet_id = var.public_subnet_id

     tags = {
        Name = "${var.vpc_name}-NAT "
    }

  
}
