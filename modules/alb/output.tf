output "dns_name" {
  value = aws_alb.mod.dns_name
}

output "zone_id" {
  value = aws_alb.mod.zone_id
}

output "arn" {
  value = aws_alb.mod.arn
}

output "listener_http_arn" {
  value = var.listener_80 ? aws_alb_listener.http.0.arn : null
}

output "listener_https_arn" {
  value = var.listener_443 ? aws_alb_listener.https.0.arn : null
}

output "arn_suffix" {
  value = aws_alb.mod.arn_suffix
}
