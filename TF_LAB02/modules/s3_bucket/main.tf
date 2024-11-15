provider "aws" {
  region = "us-east-1" 
}

data "null_data_source" "existing_bucket_check" {
  inputs = {
    bucket_name = "bucket-hari-nem-nem"
  }
}

resource "aws_s3_bucket" "s3" {
  #count  = length(data.aws_s3_bucket.existing_bucket.id) == 0 ? 1 : 0 
  #count  = length(try(data.aws_s3_bucket.existing_bucket.id, "")) == 0 ? 1 : 0
  #count  = length(try(data.aws_s3_bucket.existing_bucket.id, "")) == 0 ? 1 : 0
  count  = length(try(data.null_data_source.existing_bucket_check.outputs["bucket_name"], "")) == 0 ? 1 : 0
  bucket = "bucket-hari-nem-nem" 

  versioning {
    enabled = true
  }

  
  tags = {
    Name        = "Harinem_Bucket"
    Environment = "dev"
  }

}
