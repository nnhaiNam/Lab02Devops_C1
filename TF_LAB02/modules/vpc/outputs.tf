output "vpc_id" {
    value = aws_vpc.main_vpc.id
  
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet.id  
}

output "private_subnet_id" {
    value = aws_subnet.private_subnet.id  
}

output "internet_gateway_id" {
    value =aws_internet_gateway.igw.id   
}

output "default_sg_id" {
    value = aws_security_group.default.id
  
}