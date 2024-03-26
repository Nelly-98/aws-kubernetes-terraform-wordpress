output "cluster_id" {
  description = "L'ID du cluster EKS."
  value       = aws_eks_cluster.cluster.id
}

output "cluster_endpoint" {
  description = "L'endpoint pour accéder au cluster EKS."
  value       = aws_eks_cluster.cluster.endpoint
}

output "node_group_id" {
  description = "L'ID du groupe de nœuds du cluster EKS."
  value       = aws_eks_node_group.node_group.id
}
