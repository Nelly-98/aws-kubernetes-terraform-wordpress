output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.example.id
}

output "cloudfront_distribution_domain" {
  value = aws_cloudfront_distribution.example.domain_name
}
