output "db_instance_endpoint" {
  description = "L'endpoint de l'instance RDS pour les connexions à la base de données."
  value       = aws_db_instance.default.endpoint
}

output "db_instance_username" {
  description = "Le nom d'utilisateur de l'instance RDS."
  value       = var.username
}

output "db_instance_name" {
  description = "Le nom de la base de données créée."
  value       = var.db_name
}
