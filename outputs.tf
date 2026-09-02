output "cloudfront_url" {
  description = "HTTPS URL of the CDN in front of the S3 origin"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "bucket_name" {
  value = aws_s3_bucket.site.bucket
}
