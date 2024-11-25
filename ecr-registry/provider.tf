terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "terraform-backend-amaan-unique1234"
    key            = "ap-south-1/dev/ecr/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-dev-laravel-sg"
    profile        = "amaan"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0"
    }
  }
}




