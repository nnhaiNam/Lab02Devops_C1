variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID where the NAT Gateway will be created"
}

variable "vpc_name" {
  type = string
  description = "Name of VPC"
  
}