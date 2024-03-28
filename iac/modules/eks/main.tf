resource "aws_eks_cluster" "cluster_poei" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

}

resource "aws_eks_node_group" "node_poei" {
  cluster_name    = aws_eks_cluster.cluster_poei.name
  node_group_name = "poei-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}



