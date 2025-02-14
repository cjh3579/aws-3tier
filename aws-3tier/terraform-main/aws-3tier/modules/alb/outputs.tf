output "alb_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.alb.dns_name
}

output "tg_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.tg.arn
}
