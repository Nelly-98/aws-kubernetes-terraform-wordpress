output "repository_urls" {
  description = "Les URI des dépôts ECR créés."
  value       = aws_ecr_repository.ecr_repo.*.repository_url
}
