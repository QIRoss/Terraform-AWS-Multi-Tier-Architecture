provider "aws" {
  profile="qiross"
  region = var.region-name
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "three-tier-architecture-bucket"

  tags = {
    Name = "Terraform State Bucket"
  }
}

# Optionally, you can add an S3 bucket policy for security
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.tf_state.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}
