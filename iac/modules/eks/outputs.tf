output "cluster_id" {
  description = "The ID of the EKS cluster."
  value       = aws_eks_cluster.cluster_poei.id
}

output "node_group_id" {
  description = "The ID of the EKS node group."
  value       = aws_eks_node_group.node_poei.id
}
