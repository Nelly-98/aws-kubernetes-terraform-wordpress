# Module Terraform AWS VPC

Ce module Terraform est utilisé pour créer et gérer une Virtual Private Cloud (VPC) dans AWS, avec des sous-réseaux publics et privés, ainsi qu'un groupe de sous-réseaux pour les instances de base de données (RDS).

- Il crée une Virtual Private Cloud (VPC) dans AWS avec des sous-réseaux publics et privés, une passerelle Internet, des tables de routage, et un groupe de sous-réseaux pour les instances de base de données (RDS).

# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_vpc.main| resources | 
|  aws_subnet.public | resources | 
|  aws_subnet.private | resources | 
|  aws_internet_gateway.main | resources | 
|  aws_route_table.public | resources | 
|  aws_route_table_association.public | resources | 
|  aws_route_table.private | resources | 
|  aws_route_table_association.private| resources | 
|  aws_db_subnet_group.rds | resources | 


# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|project_name |Project name to include in tags.| string|  | yes|
cidr |CIDR block for the VPC.|  string  |    | yes |
azs |List of availability zones in the region|  list(string)  |    | yes |
public_subnet_cidrs |CIDR blocks for the public subnets.|  list(string) |    | yes |
private_subnet_cidrs |CIDR blocks for the private subnets.|  ist(string)  |    | yes |

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  vpc_id | Id du vpc | 
|  public_subnets_ids | id du sous réseau publique| 
|  private_subnets_ids | id du sous réseau privé| 
|  rds_subnet_group_name | nom du sous réseau pour les RDS| 
