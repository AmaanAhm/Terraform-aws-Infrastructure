variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "tf_backend_bucket_name" {
  type        = string
  default     = "terraform-backend-amaan-unique1234"
  description = "S3 Bucket name to be used as backend"
}

variable "dynamodb_table_name" {
  type        = string
  default     = "terraform-lock-laravel"
  description = "DynamoDB Table name to be used as backend"
}

variable "tf_logging_bucket" {
  type        = string
  default     = ""
  description = "S3 bucket for logging"
}

variable "tf_logging_bucket_prefix" {
  type        = string
  default     = "/"
  description = "Prefix of S3 bucket for logging"
}

variable "create_kms_key" {
  type    = bool
  default = true
}

variable "kms_key_arn" {
  type    = bool
  default = true
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Region id for S3 Bucket to be used as backend"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Region id for S3 Bucket to be used as backend"
}

