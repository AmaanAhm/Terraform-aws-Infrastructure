output "filtered_subnet_ids" {
  value = data.aws_subnets.subnets.ids[0]
  description = "List of filtered subnet IDs based on the provided filters"
}

output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

