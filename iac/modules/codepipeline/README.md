  
# Module Terraform pour CI/CD avec AWS CodePipeline et CodeBuild.

Ce module Terraform déploie une infrastructure CI/CD sur AWS en utilisant AWS CodePipeline et CodeBuild pour automatiser le processus de déploiement d'une application Wordpress. Il comprend les ressources suivantes :

- Bucket S3 Backend : Un bucket S3 pour stocker l'état de Terraform.
- CodePipeline: Une pipeline CI/CD pour orchestrer le déploiement de l'application Wordpress.
- CodeBuild : Des projets CodeBuild pour les étapes de construction, de planification et d'application.
- Rôles IAM : Des rôles IAM avec les autorisations nécessaires pour les services CodePipeline et CodeBuild.

# Requirements
Pas  de requirements.

# Providers
Pas de provider

# Resources

| Noms |  Types|
| -------- | -------- | 
|  aws_caller_identity.current | data | 
|  aws_iam_policy_document.codepipeline-policy-document | data | 
| account_id |  locals|
| projects |  locals|
|  aws_iam_policy.codepipeline-policy | resource | 
|  aws_iam_role.codepipeline-role | resource | 
|  aws_iam_role_policy_attachment.codepipeline-policy-attachment | resource | 
|  aws_iam_policy.codebuild-policy| resource | 
|  aws_iam_role.codebuild-role| resource | 
|  aws_iam_role_policy_attachment.codebuild-policy-attachment1 | resource | 
|  aws_iam_role_policy_attachment.codebuild-policy-attachment2 | resource | 
| aws_s3_bucket.s3-bucket-backend |  resource|
| aws_s3_bucket_versioning.s3-bucket-backend-versioning |  resource|
| aws_s3_object.s3-object-store |  resource|
| aws_codebuild_project.codebuild_project_stage |  resource|
| aws_codepipeline.codepipeline |  resource|


# Variables

| Noms| Descption |Types|Default|Required|
| -------- | -------- | -------- | -------- | ------- |
|codebuild_role_name |  | string | "codebuild-role" | yes|
codebuild_plan_project_name |  |  string  |   "wordpress-codebuild" | yes |
s3_bucket_name | |  string  |   wordpress-artefact-bucket" | yes |
codepipeline_policy_name ||  string  |   "codepipeline-policy" | yes |
codepipeline_role_name |  |  string  |   "codepipeline-role"  | yes |
codepipeline_name | |  string  |   "ci-cd-poei"  | yes |
app_env |  |  string  |   "dev" | yes |
db_creds | | map(string) 
    

