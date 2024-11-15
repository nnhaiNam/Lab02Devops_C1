# EC2 instance
resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids    
    key_name = var.key_name

    user_data = var.command
    


    monitoring      = true 

    metadata_options {
      http_tokens = "required"  # Forces the use of IMDSv2 (IMDSv1 will be disabled)
      http_endpoint = "enabled" # Enables the Instance Metadata Service
    }

    tags = {
        Name=var.instance_name
    }


}

# checkov:skip=CKV2_AWS_19:Only assign EIP for public EC2 instances
# Elastic IP for Public EC2 instance
resource "aws_eip" "public_eip" {
  count    = var.associate_public_ip ? 1 : 0
  instance = aws_instance.ec2.id
}