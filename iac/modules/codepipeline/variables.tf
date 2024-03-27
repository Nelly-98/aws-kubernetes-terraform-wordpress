variable "region" {
  default = "eu-west-3"
  type    = string
}

############## codebuild var ##################
variable "codebuild_policy_name" {
  type    = string
  default = "codebuild-policy"
}

variable "codebuild_role_name" {
  type    = string
  default = "codebuild-role"
}

variable "codebuild_plan_project_name" {
  type    = string
  default = "wordpress-codebuild"
}

############# bucket var ##################
variable "s3_bucket_name" {
  type    = string
  default = "wordpress-artefact-bucket"
}

################ codepipeline ############
variable "codepipeline_policy_name" {
  type    = string
  default = "codepipeline-policy"
}

variable "codepipeline_role_name" {
  type    = string
  default = "codepipeline-role"
}

variable "codepipeline_name" {
  type    = string
  default = "ci-cd-poei"
}

################# global ##################
variable "app_env" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type = string
}