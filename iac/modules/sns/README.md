# Module Terraform AWS SNS

Ce module Terraform est utilisé pour créer et gérer des topics SNS (Simple Notification Service) dans AWS et configurer des abonnements à ces topics.

- Il un topic SNS dans AWS et configure des abonnements à ce topic pour envoyer des notifications via Slack et/ou e-mail.
- Assurez-vous que les services cibles (Slack, e-mail) ont été correctement configurés pour recevoir les notifications envoyées par SNS.

# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_sns_topic.my_topic | resources | 
|  aws_sns_topic_subscription.slack_subscription| resources | 
|  aws_sns_topic_subscription.email_subscription | resources | 


# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|topic_name |The name of the SNS topic| string|  | yes|
slack_webhook_url |Slack webhook URL for notifications.|  string  |    | yes |
email_address |Email address for notifications|  string  |    | yes |

# Outputs

| Noms |  Descriptions|
| -------- | -------- | 
|  sns_topic_arn | | 
