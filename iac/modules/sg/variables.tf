variable "vpc_id" {
  description = "L'ID du VPC où le groupe de sécurité sera créé."
  type        = string
}

variable "name" {
  description = "Le nom du groupe de sécurité."
  type        = string
}

variable "description" {
  description = "La description du groupe de sécurité."
  type        = string
}

