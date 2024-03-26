resource "aws_ecr_repository" "ecr_repo" {
  count = length(var.repository_names)

  name                 = "${var.project_name}-${var.repository_names[count.index]}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = var.project_name
  }
}
