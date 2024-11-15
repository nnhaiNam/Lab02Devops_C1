provider "aws" {
  region = "us-east-1" 
}



resource "aws_s3_bucket" "s3" {
    bucket = "bucket-hari-nem-nem"

  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "Harinem_Bucket"
    Environment = "dev"
  }

}



