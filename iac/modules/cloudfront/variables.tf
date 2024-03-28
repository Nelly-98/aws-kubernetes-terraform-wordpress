variable "load_balancer_dns_name" {
  description = "Le nom DNS du Load Balancer AWS d'où CloudFront doit récupérer le contenu."
  type        = string
}


variable "default_root_object" {
  description = "Le fichier que CloudFront demande à votre origine."
  type        = string
  default     = "index.html"
}
