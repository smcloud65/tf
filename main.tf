terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "pcs_bucket" {
  bucket = "pcs-unique-bucket-demo01"  
  acl = "public-read"

  tags = {
    Name        = "S3Bucket"
    Environment = "demo"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.pcs_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.pcs_bucket.arn
}
