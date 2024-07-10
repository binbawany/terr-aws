output "route53_record" {
  value = aws_route53_record.main.fqdn
}
