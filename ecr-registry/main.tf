module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "private-example"
  repository_type = "private"
  repository_image_tag_mutability = "MUTABLE"
  repository_read_write_access_arns = ["arn:aws:iam::440444819924:user/amaan"]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}