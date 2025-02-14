output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "Public Subnets"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "Private Subnets"
  value       = module.network.private_subnets
}

output "alb_dns" {
  description = "ALB DNS Name"
  value       = module.alb.alb_dns
}

output "db_endpoint" {
  description = "Database endpoint"
  value       = module.database.db_endpoint
  sensitive   = true
}