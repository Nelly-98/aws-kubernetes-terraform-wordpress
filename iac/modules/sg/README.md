# Module Terraform AWS Security Group

Ce module Terraform est utilisé pour créer et gérer des groupes de sécurité AWS (Security Groups) dans un VPC.

- Il crée un groupe de sécurité AWS dans un VPC spécifié avec les règles d'entrée et de sortie spécifiées.

# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_security_group.sg_rds | resources | 

# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|vpc_id |L'ID du VPC où le groupe de sécurité sera créé.| string|  | yes|
name | Le nom du groupe de sécurité.|  string  |    | yes |
description |La description du groupe de sécurité.|  string  |    | yes |

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  security_group_id | | 
