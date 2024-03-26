variable "project_name" {
  description = "Nom du projet pour le marquage (tagging)."
  type        = string
}

variable "instance_class" {
  description = "Le type d'instance pour l'instance RDS."
  type        = string
}

variable "engine" {
  description = "Le moteur de base de données à utiliser."
  type        = string
}

variable "engine_version" {
  description = "La version du moteur de base de données à utiliser."
  type        = string
}

variable "allocated_storage" {
  description = "L'espace de stockage alloué en gigaoctets."
  type        = number
}

variable "db_name" {
  description = "Le nom de la base de données à créer lors de la création de l'instance DB."
  type        = string
}

variable "username" {
  description = "Nom d'utilisateur pour la base de données."
  type        = string
}

variable "password" {
  description = "Mot de passe pour la base de données."
  type        = string
  sensitive   = true
}

variable "subnet_group_name" {
  description = "Le nom d'un groupe de sous-réseaux DB à associer à cette instance DB."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Liste des IDs de groupes de sécurité VPC à associer."
  type        = list(string)
}
