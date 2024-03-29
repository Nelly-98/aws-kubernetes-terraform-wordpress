# Mon Projet Filerouge Services Web | Architecture Cloud | DevOps

Ce projet illustre une mise en œuvre d'une infrastructure web, orchestrée par Kubernetes, dont le provisionnement de l'IaC est faite avec Terraform et automatisée par AWS CodePipeline pour le CI/CD suite à chaque push sur GitHub.

## Structure du Projet

- `ci-cd`: Contient les configurations pour AWS CodePipeline et CodeBuild.
- `docker/`: Dockerfile et configuration pour NGINX.
  - `wordpress/`: Dockerfile pour WordPress.
  - `nginx/`: Dockerfile pour Nginx.
- `iac/`: Héberge les fichiers Terraform pour déployer l'infrastructure AWS et Kubernetes.
  - `modules/`: Modules Terraform réutilisables.
- `k8s/`:Configurations Kubernetes pour les environnements de test et de production.
  - `dev`: 
  - `prod`: 
- `.gitignore`: Fichiers ignorés par Git.
- `README.md`: Documentation du projet.

## Prérequis

- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://www.terraform.io/downloads.html)
- [kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)
- [AWS CLI](https://aws.amazon.com/cli/)
- Compte AWS avec les permissions appropriées


## Configuration

### Docker

1. Construisez les images Docker pour NGINX et WordPress:

   ```bash
   docker build -t mon-nginx nginx/.
   docker build -t mon-wordpress wordpress/.

2. Publiez ces images dans le registre d'images Amazon ECR.

### Deploiement dans un environement test avec Kubernetes

1. Création d'un cluster kubernetes 
    ```bash
   eksctl create cluster --name =my-cluster --region=eu-west-3 --version=1.19 --nodegroup-name =ng-test --node-type t2.large --nodes 1 

2. Création d'un namespace "dev" et deploiement des manifestes dans le namespace
   ```bash
   kubectl create namespace dev
   kubectl apply -f k8s/dev/mariadb/ -n dev
   kubectl apply -f k8s/dev/wordpress/ -n dev
   kubectl apply -f k8s/dev/ -n dev

3. Veérification des Pods et services
   ```bash
   kubectl get pods -n dev\
   kubectl get services -n dev\

4. Après le déploiement, accédez à votre application WordPress via l'adresse IP externe fournie par le service LoadBalancer de Kubernetes.

### Terraform

1. Naviguez vers le répertoire Terraform:
   ```bash
   cd iac/ 

2. Executer les commandes suivantes :
   ```bash
   terraform init
   terraform plan
   terraform apply

### CI-CD avec AWS CodePipeline

Chaque push sur la branche spécifiée de GitHub déclenchera automatiquement AWS CodePipeline, qui exécute les étapes configurée dans CodeBuild


1. Pour éviter des coûts inutiles, détruisez l'infrastructure AWS déployée via Terraform quand elle n'est plus nécessaire
   ```bash
   terraform destroy


Ce README est conçu pour fournir une base sur laquelle vous pouvez construire. Selon la complexité et les besoins spécifiques de votre projet, vous pourriez vouloir ajouter plus de détails sur la configuration, l'utilisation des secrets, la sécurité, et d'autres meilleures pratiques.

