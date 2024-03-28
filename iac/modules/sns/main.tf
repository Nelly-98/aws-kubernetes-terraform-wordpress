resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "slack_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "https"
  endpoint  = "https://hooks.slack.com/services/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" # Remplacez par votre endpoint Slack Webhook

}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = "nelly.guepnang@gmail.com" 

}
