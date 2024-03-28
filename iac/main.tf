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
}

module "vpc" {
  source               = "./modules/vpc"
  project_name         = "poei-web1"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-west-3a", "eu-west-3b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}


module "rds" {
  source                 = "./modules/rds"
  project_name           = "poei-web1"
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

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-poie-web1"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # One access entry with a policy associated
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::885801475464:role/EKSClusterRole"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

module "codepipeline" {
  source       = "./modules/codepipeline"
  cluster_name = module.eks.cluster_name
}


module "sns" {
  source             = "./modules/sns"
  topic_name         = "my-notification-poei"
  slack_webhook_url  = "https://hooks.slack.com/services/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"
  email_address      = "nelly.guepnang@gmail.com"
}