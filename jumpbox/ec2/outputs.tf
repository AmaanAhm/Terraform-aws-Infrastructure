output "server_sg_id" {
  value = aws_security_group.server.id
}

output "aws_subnets" {
  value = data.aws_subnets.subnets.id
}

output "aws_security_group" {
  value = aws_security_group.server.id
}