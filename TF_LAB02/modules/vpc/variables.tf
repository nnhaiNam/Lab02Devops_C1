variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
}

variable "vpc_name" {
    type = string
    description = "Name of VPC"
  
}

variable "availability_zone" {
    type        = string 
    description = "Availability Zones"     
}