resource "aws_s3_bucket" "s3" {
  bucket = "bucketHarinemnem" 

  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "Harinem_Bucket"
    Environment = "dev"
  }


}
