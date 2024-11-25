data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


resource "aws_kms_key" "tf_backend" {
  count                   = var.create_kms_key ? 1 : 0
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_s3_bucket" "tf_backend" {
  bucket = var.tf_backend_bucket_name
  tags = {
    Name = var.tf_backend_bucket_name
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_backend" {
  bucket = aws_s3_bucket.tf_backend.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.create_kms_key ? aws_kms_key.tf_backend[0].arn : var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_logging" "tf_backend" {
  count  = var.tf_logging_bucket != "" ? 1 : 0
  bucket = aws_s3_bucket.tf_backend.id

  target_bucket = var.tf_logging_bucket
  target_prefix = var.tf_logging_bucket_prefix
}

resource "aws_s3_bucket_versioning" "tf_backend" {
  bucket = aws_s3_bucket.tf_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "tf_backend" {
  bucket = aws_s3_bucket.tf_backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_backend" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  point_in_time_recovery {
    enabled = true
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = var.create_kms_key ? aws_kms_key.tf_backend[0].arn : var.kms_key_arn
  }
  tags = {
    Name = var.dynamodb_table_name
  }
}

