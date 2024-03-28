variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}


variable "eks_cluster_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the EKS cluster."
  type        = string
}

variable "eks_node_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the EKS nodes."
  type        = string
}
