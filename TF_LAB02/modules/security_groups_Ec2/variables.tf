variable "vpc_id" {
    type = string
    description = "ID of VPC"
  
}

variable "ssh_cidr_block" {
  type        = string
  description = "CIDR block allowed to SSH"
}

variable "vpc_name" {
  description = "The name of the VPC (used for tagging resources)"
  type        = string
}