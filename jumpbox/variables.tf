#data aws variables & common variable
variable "vpc_name" {
  description = "VPC Name for the AWS account and region specified"
  type        = string
  default     = "dev"
}

variable "custom_string" {
  description = "Initials for any service"
  type        = string
  default     = "custom"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
}

variable "ssh_cidr_list" {
  type        = list(any)
  default     = ["127.0.0.1/32"]
  description = "ssh cidr"
}

variable "environment" {
  type    = string
  default = "stage"
}

variable "region" {
  description = "The AWS region to create things in."
  type        = string
  default     = "ap-south-1"
}

#backend state file
variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Region id for S3 Bucket to be used as backend"
}

#jumpbox
variable "image_id" {
  type        = string
  description = "AMI Id for EC2 Instance"
}

variable "instance_type_jumpbox" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "az" {
  type        = string
  description = "Availability zone id"
  default     = "ap-south-1a"
}

variable "app_name" {
  type = string
  description = "Application name"
  default     = "" 
}

variable "subnet_tag_value_public" {
  description = "Subnet tag value"
  type        = string
  default     = "public"
}

variable "subnet_tag" {
  description = "Tag used on subnets to define subnet type"
  type        = string
  default     = "subnet_type"
}



#common tags
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


