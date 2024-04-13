# Module Terraform AWS EKS

Ce module Terraform est utilisé pour créer et gérer des clusters EKS (Elastic Kubernetes Service) dans AWS, ainsi que les groupes de noeuds associés.

- Il crée un cluster EKS avec un groupe de noeuds associé dans AWS.
- Les rôles IAM spécifiés (eks_cluster et eks_nodes) doivent exister et posséder les autorisations appropriées avant d'utiliser ce module.
- Il utilise les les sous-réseaux spécifiés dans subnet_ids qui sont été correctement configurés pour prendre en charge EKS.


# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_iam_role.eks_cluster | resources | 
|  aws_eks_cluster.aws_eks | resources | 
|  aws_iam_role.eks_nodes | resources | 
|  aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy | resources | 
|  aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy | resources | 
|  aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly | resources | 


# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|cluster_name |The name of the EKS cluster.| string|  | yes|
subnet_ids | A list of subnet IDs to launch resources in.|  list(string)  |    | yes |
eks_cluster_role_arn | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the EKS cluster.|  string  |    | yes |
eks_node_role_arn | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the EKS nodes.|  string  |    | yes |

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  cluster_id | The ID of the EKS cluster. | 
|  node_group_id | The ID of the EKS node group. | 