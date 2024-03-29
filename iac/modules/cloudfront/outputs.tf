output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cloudfront.id
}
output "cloudfront_distribution_domain" {
  value = aws_cloudfront_distribution.cloudfront.domain_name
}
