resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  tags = {
    Name        = "ssa-c03"
    Environment = "Dev"
  }
}
