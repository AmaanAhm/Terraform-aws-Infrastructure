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

variable "vpc_base_cidr" {
  description = "default cidr block"
  type        = string
  default     = "10.2.0.0/16"
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "dev-vpc"
}

variable "enable_dns_hostnames" {
  description = "enable DNS hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "enable DNS support"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "ensure only one nat gateway is craeted per az"
  type        = string
  default     = "true"
}

variable "azs" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
  description = "List of AZs"
}

variable "private_subnets" {
  description = "private subnets"
  type        = list(any)
  default     = ["10.2.1.0/24", "10.2.2.0/24"]
}

variable "private_subnet_tags" {
  description = "Tags to be attached to private subnets"
  type        = map(any)
  default = {
    subnet_type = "private"
  }
}

variable "public_subnets" {
  description = "public subnets"
  type        = list(any)
  default     = ["10.2.11.0/24", "10.2.12.0/24"]
}

variable "public_subnet_tags" {
  description = "Tags to be attached to public subnets"
  type        = map(any)
  default = {
    subnet_type = "public"
  }
}

variable "database_subnets" {
  description = "database subnets"
  type        = list(any)
  default     = ["10.2.21.0/24", "10.2.22.0/24"]
}

variable "database_subnets_tags" {
  description = "Tags to be attached to database subnets"
  type        = map(any)
  default = {
    subnet_type = "db"
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    "terraform" = "true"
  }
}
