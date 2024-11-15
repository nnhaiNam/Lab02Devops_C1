# Public EC2 Security Group: Allow SSH from specific IP

# checkov:skip=CKV2_AWS_5: Security Group attached to resource in separate module
resource "aws_security_group" "public_sg" {
    description = "Security Group for Public EC2 Instances"
    name = "Security Group for public EC2"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.ssh_cidr_block]
        description = "Allow SSH from a specific IP address"

    }

     ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP"

    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"

    }

    tags = {
        Name = "${var.vpc_name}-public-ec2-sg"
    }
   
    
}


# checkov:skip=CKV2_AWS_5: Security Group attached to resource in separate module
resource "aws_security_group" "private_sg" {
    description = "Security Group for Private EC2 Instances"
    name = "Security Group for private EC2"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.public_sg.id]
        description = "Allow SSH from Public EC2 Instance"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }

     tags = {
        Name = "${var.vpc_name}-private-ec2-sg"
    }
  
}

