# Module specfic code
resource "aws_api_gateway_stage" "stage" {
  depends_on = [aws_api_gateway_deployment.api_deployment]

  stage_name           = var.stage_name
  rest_api_id          = var.rest_api_id
  deployment_id        = aws_api_gateway_deployment.api_deployment.id
  xray_tracing_enabled = "true"

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.log_group.arn
    format          = file("${path.module}/log_format.json")
  }

}

# Deployment
resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = var.rest_api_id

  description = "Deployed at ${timestamp()}"

  triggers = {
    deployed_at = timestamp()
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Mapping
resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = var.rest_api_id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  domain_name = var.domain_name
  base_path   = var.base_path
}

resource "aws_api_gateway_method_settings" "method_settings" {
  rest_api_id = var.rest_api_id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = "*/*" # Enable for all methods

  settings {
    metrics_enabled    = true
    data_trace_enabled = true
    logging_level      = "INFO"
  }

  depends_on = [aws_api_gateway_stage.stage]
}