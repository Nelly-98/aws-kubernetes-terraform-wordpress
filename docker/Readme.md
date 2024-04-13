# Docker

Ce répertoire contient les fichiers Dockerfile pour la construction d'images Docker pour les services NGINX et Wordpress.

## Prérequis

- [Docker](https://docs.docker.com/get-docker/)

## Description des Fichiers:

1. nginx/ : Ce sous-répertoire contient les fichiers nécessaires à la construction de l'image Docker pour le serveur web NGINX.

     - Dockerfile: Ce fichier contient les instructions pour construire l'image Docker NGINX.
     
    - nginx.conf : Ce fichier contient la configuration NGINX utilisée par le serveur web.

2. wordpress/ : Ce sous-répertoire contient les fichiers nécessaires à la construction de l'image Docker pour l'application Wordpress.

      - Dockerfile : Ce fichier contient les instructions pour construire l'image Docker Wordpress.


##  Utilisation

Accédez au sous-répertoire du service que vous souhaitez utiliser (par exemple, nginx ou wordpress).
Construisez l'image Docker en exécutant la commande
 ```bash
docker build -t <nom_image> .
```
dans le répertoire du service.
Une fois l'image construite, vous pouvez exécuter un conteneur à partir de cette image en utilisant la commande  
```bash
docker run <nom_image>
```