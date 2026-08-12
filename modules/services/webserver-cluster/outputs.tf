output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.example.dns_name
}

output "asg_name" {
value = aws_autoscaling_group.example.name
description = "The name of the Auto Scaling Group"
}