# Projet de fin de formation | Projet Filerouge Services Web | Architecture Cloud | DevOps

Ce projet vise à déployer une application WordPress à trois niveaux, orchestrée par Kubernetes. L'infrastructure est mise en place grâce à Terraform pour l'IaC, tandis que le déploiement est automatisé via AWS CodePipeline pour le CI/CD.

  
## <p align="center">AWS CodePipeline</p>
  
Nous utilisons AWS CodePipeline dans notre projet pour gérer le processus livraison continue. Il comprend deux étapes principales : 

- la phase Source, qui gère le téléchargement du code source depuis le dépôt GitHub
- la phase build, qui gère l'approbation ou le rejet des modifications apportées dans le commit poussé vers le dépôt GitHub.


## <p align="center">AWS CodeBuild</p>
  
    
En ce qui concerne AWS CodeBuild, il est utilisé pour la phase de CI/CD de notre projet. Il comprend également deux étapes clés : la phase de Plan, qui génère le plan pour notre code Terraform, et la phase d'Application, qui crée l'infrastructure AWS basée sur le code Terraform fourni.

## <p align="center">Terraform</p>
  
    
Pour ce qui est de Terraform, il s'agit d'un outil open source utilisé pour la création, la modification et la version de l'infrastructure as code (iac). Il permet de décrire l'infrastructure cloud de manière déclarative à l'aide de fichiers de configuration. Ces fichiers décrivent les ressources nécessaires et les dépendances entre elles, ce qui permet à Terraform de créer et de gérer l'infrastructure de manière efficace et reproductible.


## <p align="center">Kubernetes</p>
  

    
En ce qui concerne Kubernetes, c'est une plateforme open source permettant d'automatiser le déploiement, la mise à l'échelle et la gestion des applications conteneurisées. Kubernetes facilite la gestion des conteneurs à grande échelle, en fournissant des fonctionnalités telles que l'orchestration, la gestion des ressources, la surveillance et la mise à jour automatique des applications. Il est largement utilisé pour déployer et gérer des applications dans des environnements cloud et sur site, offrant une approche flexible et évolutive pour exécuter des charges de travail conteneurisées.

## <p align="center">Structure du Projet</p>

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

## <p align="center">Prérequis</p>

- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://www.terraform.io/downloads.html)
- [kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)
- [AWS CLI](https://aws.amazon.com/cli/)
- Compte AWS avec les permissions appropriées

## <p align="center">Architecture</p>

![alt text](https://github.com/POEI-SERVICEWEB1-STORM/POEI-PROJECT/blob/main/images/archiecture_technique-Page-3.drawio%20(1).png)
![alt text](https://github.com/POEI-SERVICEWEB1-STORM/POEI-PROJECT/blob/main/images/archiecture_technique-Page-4.drawio%20(2).png)


## <p align="center">Configuration</p>

### Docker

1. Construisez les images Docker pour NGINX et WordPress:

   ```bash
   docker build -t mon-nginx nginx/.
   docker build -t mon-wordpress wordpress/.

2. Publiez ces images dans le registre d'images Amazon ECR.

   ```bash
   aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin account-id.dkr.ecr.region.amazonaws.com
   docker tag mon-wordpress:latest account-id.dkr.ecr.region.amazonaws.com/wordpress-container:latest
   docker push account-id.dkr.ecr.region.amazonaws.com/wordpress-container:latest

### Deploiement dans un environement test avec Kubernetes

1. Création d'un cluster kubernetes 
    ```bash
   eksctl create cluster --name my-cluster --region my-region --version 1.19 --nodegroup-name ng-test --node-type t2.large --nodes 1 

2. Création d'un namespace "dev" et deploiement des manifestes dans le namespace
   ```bash
   kubectl create namespace dev
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

### Destruction des ressoures

1. Pour éviter des coûts inutiles, détruisez l'infrastructure AWS déployée via Terraform quand elle n'est plus nécessaire
   ```bash
   terraform destroy


Ce README est conçu pour fournir une base sur laquelle vous pouvez construire. Selon la complexité et les besoins spécifiques de votre projet, vous pourriez vouloir ajouter plus de détails sur la configuration, l'utilisation des secrets, la sécurité, et d'autres meilleures pratiques.

