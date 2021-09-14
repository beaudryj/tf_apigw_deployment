# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/apigateway/${var.function_name}" # Naming log group same as lambda function for log group consistency

}
