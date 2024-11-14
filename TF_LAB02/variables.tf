variable "vpc_cidr_block" {
    description = "CIDR block for VPC"
    type = string
    #default = "10.0.0.0/16"
  
}

variable "public_subnet_cidr" {
  description = "CIDR block cho Public Subnet"
  type        = string
  #default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block cho Private Subnet"
  type        = string
  #default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for Subnet"
  type        = string
  #default     = "us-east-1a"
}

variable "vpc_name" {
    description = "Name of VPC"
    type = string
    #default = "Custom My VPC"
  
}

variable "my_ip_adress" {
  description = "My IP address"
  type = string  
  
}


variable "ami" {
  type = string
  description = "AMI ID for the EC2 instance"
  default = "ami-0fff1b9a61dec8a5f"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  
}

variable "key_name" {
  type = string
  description = "Name of file PEM"
  default = "aws"
  
}

variable "command" {
  type    = string
  default = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to Terraform Nginx Web Server by HariNem</h1>" | sudo tee /usr/share/nginx/html/index.html
EOF
}