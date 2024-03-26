terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "projet-tf-backend-state"
    key    = "terraform.tfstate"
    region = "eu-west-3"

  }
}

provider "aws" {
  region                   = "eu-west-3"
  shared_credentials_files = ["../../../.aws/credentials"]
  profile                  = "projet"
}

module "vpc" {
  source               = "./modules/vpc"
  project_name         = "vpc-poei-web1"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-west-3a", "eu-west-3b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}


module "rds" {
  source                 = "./modules/rds"
  project_name           = "rds-poei-web1"
  instance_class         = "db.t3.micro"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  allocated_storage      = 20
  db_name                = "wordpress"
  username               = "admin"
  password               = "unMotDePasse"
  subnet_group_name      = module.vpc.rds_subnet_group_name
  vpc_security_group_ids = [module.sg.security_group_id] # Le groupe de sécurité va permettre les connexions à RDS 
}

module "eks" {
  source                = "./modules/eks"
  cluster_name          = "eks-poie-web1"
  subnets               = module.vpc.public_subnets_ids
  vpc_id                = module.vpc.vpc_id
  node_group_name       = "poei-group-de-nodes"
  node_instance_type    = "t3.medium"
  node_desired_capacity = 2
  node_max_capacity     = 3
  node_min_capacity     = 1
  cluster_iam_role_arn  = "arn:aws:iam::885801475464:role/EKSClusterRole"
  node_iam_role_arn     = "arn:aws:iam::885801475464:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
}

module "ecr" {
  source           = "./modules/ecr"
  project_name     = "ecr-poei-web1"
  repository_names = ["frontend", "backend"]
}

module "sg" {
  source      = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
  name        = "sg-rds"
  description = "Security Group pour les instances RDS"
}



