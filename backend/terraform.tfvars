aws_profile            = "amaan"
region                 = "ap-south-1"
tf_backend_bucket_name = "terraform-backend-amaan-unique1234"
dynamodb_table_name    = "terraform-lock-dev-laravel-sg"
common_tags = {
  "owner"     = "ahm.amaan@gmail.com"
  "env"       = "dev"
  "terraform" = "true"
  "project"   = "tf-backend-dev-sg"
  "purpose"   = "storage"
}
tf_logging_bucket        = ""
tf_logging_bucket_prefix = "/"
create_kms_key           = true
kms_key_arn              = true