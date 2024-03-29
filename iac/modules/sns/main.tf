resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}


# Définition de la fonction Lambda
resource "aws_lambda_function" "my_lambda_function" {
  function_name = "mySnsToSlackFunction"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  
  # Assurez-vous que le chemin vers le fichier ZIP est correct
  filename         = "${path.module}/sns-fonction.zip"
  source_code_hash = filebase64sha256("${path.module}/sns-fonction.zip")

  role = aws_iam_role.lambda_exec_role.arn
}

# Rôle IAM pour la fonction Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid = ""
    }]
  })
}

# Politique IAM pour autoriser Lambda à logger et accéder à SNS
resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect = "Allow",
        Action = "sns:Publish",
        Resource = "*"
      }
    ]
  })
}

# Abonnement SNS à Lambda
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.my_lambda_function.arn
}
