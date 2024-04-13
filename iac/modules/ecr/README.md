# Module Terraform AWS ECR

Ce module Terraform est utilisé pour créer et gérer des référentiels Elastic Container Registry (ECR) dans AWS.

Il crée des référentiels Elastic Container Registry (ECR) avec une configuration de balayage d'image activée pour balayer les images lorsqu'elles sont poussées dans le référentiel.
Les noms des référentiels ECR sont générés en utilisant le nom du projet et les noms de référentiels fournis.

# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_ecr_repository.ecr_repo | resources | 


# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|repository_names | Liste des noms des dépôts ECR à créer. | list(string) |  | yes|
project_name | Nom du projet, utilisé pour le tag des ressources. |  string  |    | yes |

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  repository_urls | Les URI des dépôts ECR créés. | 