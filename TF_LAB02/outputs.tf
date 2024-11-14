output "vpc_id" {
  description = "ID của VPC được tạo"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID của Public Subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID của Private Subnet"
  value       = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID của Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

