#############################
# General
#############################
variable "rest_api_id" {
  description = "if of rest api to deploy to"
  default     = ""
}

variable "base_path" {
  description = "name of api for base path"
  default     = ""
}


#############################
# API Gateway
#############################

variable "stage_name" {
  description = "The name of the deployment stage"
  type        = string
  default     = "change me"
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "changeme"
}

#############################
# Route 53
#############################
variable "domain_name" {
  description = "The fully-qualified domain name to register"
  type        = string
}

#############################
# General Shared
#############################

variable "tags" {
  description = "Default Tags"
  type        = map
}
