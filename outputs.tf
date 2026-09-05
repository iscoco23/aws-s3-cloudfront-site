output "cloudfront_url" {
  description = "HTTPS URL of the CDN in front of the S3 origin"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "bucket_name" {
  value = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "gha_role_arn" {
  description = "Role GitHub Actions assumes (OIDC). No access keys."
  value       = aws_iam_role.gha.arn
}