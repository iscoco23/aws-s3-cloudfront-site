data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "site" {
  bucket = "aws-s3-cloudfront-site-${data.aws_caller_identity.current.account_id}"

  # destroying resources for lab
  force_destroy = true

  tags = {
    Bill    = "lab"
    Project = "aws-s3-cloudfront-site"
  }
}

# blocking public access to s3 bucket
resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# use SSE-S3 to encrypt object at rest
resource "aws_s3_bucket_server_side_encryption_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# enable versioning
resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.site.id

  versioning_configuration {
    status = "Enabled"
  }
}
