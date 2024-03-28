data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

data "aws_iam_policy_document" "codepipeline-policy-document" {
  statement {
    actions   = ["cloudwatch:*"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions = ["codebuild:*"]
    resources = [
       "arn:aws:codebuild:eu-west-3:885801475464:project/build"
    ]
    effect = "Allow"
  }

  statement {
    actions = ["codestar-connections:UseConnection", "codestar-connections:DescribeConnection"]
    resources = [
    "arn:aws:codestar-connections:eu-west-3:885801475464:connection/*"]
    effect = "Allow"
  }

  statement {
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.s3-bucket-backend.arn}/*"]
    effect    = "Allow"
  }

  statement {
    actions = ["codepipeline:GetPipeline","codepipeline:StartPipelineExecution","codepipeline:GetPipelineState"]
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "codepipeline-policy" {
  name   = var.codepipeline_policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.codepipeline-policy-document.json
}

resource "aws_iam_role" "codepipeline-role" {
  name = var.codepipeline_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole", 
        Principal = {
          Service = "codepipeline.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline-policy-attachment" {
  policy_arn = aws_iam_policy.codepipeline-policy.arn
  role       = aws_iam_role.codepipeline-role.id
}

data "aws_iam_policy_document" "codebuild-policy-document" {
 statement {
    actions   = ["logs:*", "iam:*"]
    resources = ["*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["ecr:*", "eks:*", "s3:*", "rds:*", "sns:*", "ec2:*", "secretsmanager:GetSecretValue"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.s3-bucket-backend.arn}/*",
      "arn:aws:s3:::projet-tf-backend-state",
      "arn:aws:s3:::projet-tf-backend-state/*"
    ]
    effect = "Allow"
  }

  statement {
    actions   = ["codebuild:*"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions = ["codepipeline:*"]
    resources = ["*"]
    effect = "Allow"
  }

}

resource "aws_iam_policy" "codebuild-policy" {
  name   = var.codebuild_policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.codebuild-policy-document.json
}

resource "aws_iam_role" "codebuild-role" {
  name = var.codebuild_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "codebuild.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild-policy-attachment1" {
  policy_arn = aws_iam_policy.codebuild-policy.arn
  role       = aws_iam_role.codebuild-role.id
}

resource "aws_iam_role_policy_attachment" "codebuild-policy-attachment2" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  role       = aws_iam_role.codebuild-role.id
}