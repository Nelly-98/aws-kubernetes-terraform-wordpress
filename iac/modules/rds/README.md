# Module Terraform AWS RDS

Ce module Terraform est utilisé pour créer et gérer des instances de base de données relationnelle (RDS) dans AWS.

- Il crée une instance de base de données relationnelle (RDS) dans AWS avec les paramètres spécifiés.
- Il utilise les groupes de sécurité VPC spécifiés dans vpc_security_group_ids qui sont correctement configurés pour permettre l'accès à l'instance RDS depuis les ressources autorisées.


# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_db_instance.default | resources | 

# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|project_name |Nom du projet pour le marquage (tagging).| string|  | yes|
instance_class | Le type d'instance pour l'instance RDS.|  string  |    | yes |
engine | Le moteur de base de données à utiliser.|  string  |    | yes |
engine_version | La version du moteur de base de données à utiliser.|  string  |    | yes |
|allocated_storage |L'espace de stockage alloué en gigaoctets.| number|  | yes|
|db_name |Le nom de la base de données à créer lors de la création de l'instance DB.| string|  | yes|
|username |The name of the EKS cluster.| string|  | yes|
|password |Mot de passe pour la base de données.| string|  | yes|
|subnet_group_name |Le nom d'un groupe de sous-réseaux DB à associer à cette instance DB.| string|  | yes|
|vpc_security_group_ids |Liste des IDs de groupes de sécurité VPC à associer.| list(string)|  | yes|

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  db_instance_endpoint | L'endpoint de l'instance RDS pour les connexions à la base de données.| 
|  db_instance_username | Le nom d'utilisateur de l'instance RDS.| 
|  db_instance_name | Le nom de la base de données créée. | 
|  db_instance_password | Le nom de la base de données créée.| 