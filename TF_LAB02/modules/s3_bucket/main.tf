resource "aws_s3_bucket" "example" {
  bucket = "bucketHarinemnem"

  tags = {
    Name        = "Harinem_Bucket"
    Environment = "dev"
  }

}
