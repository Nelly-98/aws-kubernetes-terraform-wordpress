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
  source = "./modules/eks"
  cluster_name         = "cluster-poei"
  subnet_ids           = module.vpc.private_subnets_ids
  eks_cluster_role_arn = aws_iam_role.eks_cluster_role.arn
  eks_node_role_arn    = aws_iam_role.eks_node_role.arn
}


module "codepipeline" {
  source       = "./modules/codepipeline"
}

module "sns" {
  source             = "./modules/sns"
  topic_name         = "my-notification-poei"
  slack_webhook_arn  = "arn:aws:secretsmanager:eu-west-3:885801475464:secret:SlackWebhookURL-Wbp93N"
  email_address      = "nelly.guepnang@gmail.com"
}

module "cloudfront" {
  source = "./modules/cloudfront"
}
