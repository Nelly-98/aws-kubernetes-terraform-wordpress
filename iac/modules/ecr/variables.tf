variable "repository_names" {
  description = "Liste des noms des dépôts ECR à créer."
  type        = list(string)
}

variable "project_name" {
  description = "Nom du projet, utilisé pour le tag des ressources."
  type        = string
}
