output "vpc" {
  value = module.vpc
}

output "vpc_id" {
  description = "The ID for the created VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "isolated_subnets" {
  description = "List of IDs of isolated subnets"
  value       = module.vpc.database_subnets
}

output "private_cidr_blocks" {
  description = "List of IDs of private CIDR blocks"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_cidr_blocks" {
  description = "List of IDs of public CIDR blocks"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "isolated_cidr_blocks" {
  description = "List of IDs of isolated CIDR blocks"
  value       = module.vpc.database_subnets_cidr_blocks
}
