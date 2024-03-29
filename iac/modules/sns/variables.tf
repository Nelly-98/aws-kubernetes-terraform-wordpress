variable "topic_name" {
  description = "The name of the SNS topic"
  type        = string
}

variable "slack_webhook_arn" {
  description = "Slack webhook URL for notifications"
  type        = string
}

variable "email_address" {
  description = "Email address for notifications"
  type        = string
}
