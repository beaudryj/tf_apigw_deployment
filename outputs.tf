output "invoke_url" {
  value = aws_api_gateway_deployment.api_deployment.invoke_url
}

output "base_url" {
  value = replace(var.domain_name, "/^[^.]+/", "")
}