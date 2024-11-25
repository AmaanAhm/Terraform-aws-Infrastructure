variable "custom_string" {
  description = "Initials for any service"
  type        = string
  default     = "aws"
}

variable "app_name" {
  type = string
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
  description = "Subnet tag value"
  type        = string
  default     = "public"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "image_id" {
  description = "AMI Id"
  type        = string
}

variable "key_name" {
  type        = string
  description = "EC2 Key pair name"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Whether to associate public ip with the server or not"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance type"
}

variable "az" {
  type        = string
  description = "Availability zone id"
}

variable "iam_instance_profile_name" {
  type        = string
  default     = ""
  description = "IAM Instance profile name"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "User data for EC2 instance"
}

variable "egress_cidr_blocks" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "description"
}

variable "ssh_cidr_blocks_list" {
  type        = list(any)
  default     = []
  description = "description"
}

variable "list_of_extra_sg_ids" {
  type        = list(any)
  default     = []
  description = "List of extra security groups to attach to ec2 servers"
}
