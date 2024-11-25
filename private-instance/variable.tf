variable "aws_profile" {
  type        = string
  default     = "amaan"
  description = "Region id for S3 Bucket to be used as backend"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Region id for S3 Bucket to be used as backend"
}

variable "common_tags" {
  type = map(string)
  default = {
    "terraform" = "true"
  }
}

variable "vpc_name" {
  description = "VPC Name for the AWS account and region specified"
  type        = string
}

variable "subnet_tag" {
  description = "Tag used on subnets to define Tier"
  type        = string
  default     = "subnet_type"
}

variable "subnet_tag_value" {
  description = "subnet tag value"
  type = string
  default = "private"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "az" {
  description = "value"
  type = string
}

variable "instance_type" {
  description = "Cpu of instance"
  type = string
  default = "t2.micro"
}

variable "image_id" {
  description = "machine image"
  type = string
}

variable "privateInstance" {
  description = "private instance"
  type = string
  default = "private"
}

variable "custom_string" {
  description = "Initials for any service"
  type        = string
  default     = "aws"
}

variable "app_name" {
  type = string
}

variable "egress_cidr_blocks" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "description"
}

variable "ssh_cidr_blocks_list" {
  type        = list(any)
  default     = ["10.2.127.57/32"]
  description = "description"
}