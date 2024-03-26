#!/bin/bash

# Définir le contexte Kubernetes (si nécessaire)
#kubectl config use-context my-eks-cluster

# Appliquer les manifestes Kubernetes
kubectl apply -f ./../k8s/prod/

echo "Déploiement effectué avec succès."
