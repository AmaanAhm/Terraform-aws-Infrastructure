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

variable "key_name" {
  type        = string
  description = "EC2 Key pair name"
  default     = "default"
}

variable "ami_id" {
  type        = string
  description = "AMI Id for EC2 Instance"
}

variable "environment" {
  type    = string
  default = "preprod"
}

variable "cluster_name" {
  type    = string
  default = "dev"
}

variable "custom_string" {
  type        = string
  default     = "aws"
  description = "description"
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

variable "subnet_tag_value_public" {
  description = "Subnet tag value"
  type        = string
  default     = "public"
}

variable "subnet_tag_value_private" {
  description = "Subnet tag value"
  type        = string
  default     = "private"
}


variable "az" {
  type        = string
  description = "Availability zone id"
  default     = "ap-south-1"
}

variable "create_aws_auth_configmap" {
  description = "Determines whether to create the aws-auth configmap. NOTE - this is only intended for scenarios where the configmap does not exist (i.e. - when using only self-managed node groups). Most users should use `manage_aws_auth_configmap`"
  type        = bool
  default     = true
}

variable "api_list_iam_roles" {
  description = "List of API names which needs iam access"
  type        = list(string)
  default     = ["common"]
}

variable "api_list_iam_roles_namespaces" {
  description = "List of namespaces"
  type        = list(string)
  default     = ["default", "kube-system"]
}

variable "api_list_iam_roles_service_account" {
  description = "List of service accounts"
  type        = list(string)
  default     = ["toptal-dev-apps-common"]
}

variable "common_tags" {
  type = map(string)
  default = {
    "owner"     = "ahm.amaan@gmail.com"
    "env"       = "dev"
    "terraform" = "true"
    "project"   = "vpc"
    "purpose"   = "networking"
  }
}



variable "min_size" {
  type = number
  description = "minimum number of nodes that the group can scale in to"
  default = 1
}

variable "max_size" {
  type = number
  description = "maximum number of nodes that the group can scale out to"
  default = 1
}

variable "desired_size" {
  type = number
  description = "desired number of nodes that the group should launch with initially"
  default = 1
}

