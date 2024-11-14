variable "vpc_id" {
    type = string
    description = "VPC ID"
  
}

variable "internet_gateway_id" {
  type        = string
  description = "Internet Gateway ID"
}

variable "nat_gateway_id" {
    type = string
    description = "NAT Gateway ID"
  
}

variable "public_subnet_id" {
    type=string
    description = "Public subnet ID"
  
}
variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID"
}
