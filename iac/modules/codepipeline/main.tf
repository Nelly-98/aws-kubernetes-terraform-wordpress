resource "aws_s3_bucket" "s3-bucket-backend" {
  bucket = var.s3_bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_versioning" "s3-bucket-backend-versioning" {
  bucket = aws_s3_bucket.s3-bucket-backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "s3-object-store" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  key    = "artefact-store"
}

resource "aws_codebuild_project" "codebuild_project_stage" {
  name         = "build"
  description  = "Terraform Planning Build Stage for wordpress"
  service_role = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("${path.module}/buildspec.yml")
  }
}


resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline_name
  role_arn = aws_iam_role.codepipeline-role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.s3-bucket-backend.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["website_code_artefact"]
      configuration = {
        #ConnectionArn    = aws_codestarconnections_connection.aws_source_code.arn
        ConnectionArn    = "arn:aws:codestar-connections:eu-west-3:885801475464:connection/f5181edb-ee4a-446a-96c4-961d4f068328"
        FullRepositoryId = "Nelly-98/aws-kubernetes-terraform-wordpress"
        BranchName       = "main"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name            = "Build"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = ["website_code_artefact"]
      configuration = {
        ProjectName = aws_codebuild_project.codebuild_project_stage.name
        
      }
    }
  }
}