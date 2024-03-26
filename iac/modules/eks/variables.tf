variable "cluster_name" {
  description = "Le nom du cluster EKS."
  type        = string
}

variable "subnets" {
  description = "Liste des IDs des sous-réseaux pour les nœuds worker EKS."
  type        = list(string)
}

variable "vpc_id" {
  description = "L'ID du VPC où le cluster et les nœuds seront déployés."
  type        = string
}

variable "node_group_name" {
  description = "Le nom du groupe de nodes."
  type        = string
}

variable "node_instance_type" {
  description = "Le type d'instance pour les noeuds worker."
  type        = string
}

variable "node_desired_capacity" {
  description = "Le nombre souhaité de noeuds dans le groupe de noeuds."
  type        = number
}

variable "node_max_capacity" {
  description = "Le nombre maximum de noeuds dans le groupe de noeuds."
  type        = number
}

variable "node_min_capacity" {
  description = "Le nombre minimum de nœuds dans le groupe de nœuds."
  type        = number
}

variable "cluster_iam_role_arn" {
  description = "L'ARN du rôle IAM pour le cluster EKS."
  type        = string
}

variable "node_iam_role_arn" {
  description = "L'ARN du rôle IAM pour les nœuds worker du cluster EKS."
  type        = string
}


