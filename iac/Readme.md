  
# Configuration Terraform pour l'Infrastructure AWS

Ce répertoire contient la configuration Terraform pour déployer l'infrastructure AWS pour le projet "poei-web1". Cette configuration Terraform déploie une infrastructure AWS comprenant une VPC, des sous-réseaux, des groupes de sécurité, des instances RDS, des dépôts ECR, un cluster EKS, des pipelines CodePipeline, et des sujets SNS pour les notifications. Assurez-vous de comprendre les coûts associés à l'utilisation des services AWS déployés par cette configuration.

# Requirements
Pas  de requirements.

# Providers
| Noms | Version |Source
| -------- | -------- | -------|
|  aws| ~> 5.0   | hashicorp/aws |

# Modules
| Noms | Source | Version|
| -------- | ------ | -----|
|  vpc| ./modules/vpc| n/a|
|  rds|./modules/rds | n/a|
|  ecr| ./modules/ecr| n/a|
|  sg|./modules/sg |n/a |
|  eks| ./modules/eks| n/a|
|  codepipeline| ./modules/codepipeline| n/a|
|  sns|./modules/sns | n/a|


# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_iam_role.eks_cluster_role| resource    | 
|  aws_iam_role.eks_node_role| resource    | 
|  aws_iam_role_policy_attachment.eks_cluster_policy| resource    | 
|  aws_iam_role_policy_attachment.eks_service_policy| resource    | 
|  aws_iam_role_policy_attachment.eks_node_policy| resource    | 
|  aws_iam_role_policy_attachment.eks_cni_policy| resource    | 
|  aws_iam_role_policy_attachment.eks_ecr_policy| resource    | 



   
# Utilisation: 
Pour utiliser cette configuration Terraform, suivez les étapes suivantes :

- Configurez votre environnement Terraform en exécutant 
```bash
terraform init
```
- Personnalisez les valeurs des variables dans le fichier main.tf selon vos besoins.
- Exécutez 
```bash 
terraform plan
``` 
pour voir les changements proposés.
- Si les changements vous conviennent, exécutez 
```bash 
terraform apply
``` 
pour déployer l'infrastructure.