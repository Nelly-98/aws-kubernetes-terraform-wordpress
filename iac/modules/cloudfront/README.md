  
# Module Terraform CloudFront

Ce module Terraform est utilisé pour déployer et gérer une distribution CloudFront dans AWS.

- Il crée une distribution CloudFront avec une origine personnalisée qui pointe vers un load balancer.
- Le comportement de cache par défaut est configuré pour permettre uniquement les méthodes GET et HEAD et ne pas transmettre les cookies.
- La distribution CloudFront utilise le certificat par défaut de CloudFront pour la communication HTTPS.

# Requirements
Pas  de requirements dans c

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_cloudfront_distribution.example| resource    | 

# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|load_balancer_dns_name |Le nom DNS du Load Balancer AWS d'où CloudFront doit récupérer le contenu. | string | null | yes|
default_root_object |Le fichier que CloudFront demande à votre origine. |  string  |   "index.html"  | yes |
    
# Outputs 
| Noms |  Description|
| -------- | -------- | 
|  cloudfront_distribution_id |  |
| cloudfront_distribution_domain | URL de la distribution CloudFront | 
    


        
    