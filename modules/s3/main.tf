# S3
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.domain
  tags   = merge(var.tags, { Name : var.domain })
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = var.domain
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = var.domain
  versioning_configuration {
    status = "Enabled"
  }
}