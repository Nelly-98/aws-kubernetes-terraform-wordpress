output "cluster_id" {
  description = "The ID of the EKS cluster."
  value       = aws_eks_cluster.aws_eks.id
}

output "node_group_id" {
  description = "The ID of the EKS node group."
  value       = aws_eks_node_group.node.id
}
