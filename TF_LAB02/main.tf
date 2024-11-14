# VPC
module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.vpc_cidr_block
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone = var.availability_zone
    vpc_name = var.vpc_name
  
}

#Nat Gatewat
module "nat_gateway" {
    source = "./modules/nat_gateway"
    public_subnet_id = module.vpc.public_subnet_id
  
}


#Route Tables
module "route_tables" {
    source = "./modules/route_tables"
    vpc_id = module.vpc.vpc_id
    internet_gateway_id = module.vpc.internet_gateway_id
    nat_gateway_id =module.nat_gateway.nat_gateway_id
    private_subnet_id = module.vpc.private_subnet_id
    public_subnet_id = module.vpc.public_subnet_id
  
}


#Security Group For EC2
module "security_groups_ec2" {
    source = "./modules/security_groups_Ec2"
    vpc_id = module.vpc.vpc_id
    vpc_name = var.vpc_name
    ssh_cidr_block = var.my_ip_adress  
}

#Public EC2 instance

module "public_ec2_instance" {
    source = "./modules/ec2"
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnet_id
    security_group_ids = [module.security_groups_ec2.public_sg_id,module.vpc.default_sg_id]
    key_name = var.key_name
    instance_name = "PUBLIC EC2 INSTANCE"
    associate_public_ip = true
    command = var.command
  
}

#Private EC2 instance
module "private_ec2_instance" {
    source = "./modules/ec2"
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc.private_subnet_id
    security_group_ids = [module.security_groups_ec2.private_sg_id,module.vpc.default_sg_id]
    key_name = var.key_name
    instance_name = "PRIVATE EC2 INSTACE"
    associate_public_ip = false
    command = ""
  
}








