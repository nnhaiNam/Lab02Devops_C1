provider "aws" {
  region = "us-east-1" 
}

# data "aws_s3_bucket" "existing" {
#   bucket = "bucket-hari-nem-nem" 
# }




resource "aws_s3_bucket" "s3" {


  count  = length(try(data.aws_s3_bucket.existing.id, "")) == 0 ? 1 : 0
  
  versioning {
    enabled = true
  }

  
  tags = {
    Name        = "Harinem_Bucket"
    Environment = "dev"
  }

}



