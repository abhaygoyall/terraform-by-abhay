output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.webserver-cluster.alb_dns_name
}