# ------------------------------------------------------------
# Lambda settings
# ------------------------------------------------------------
variable "lambda_function_name" {
  type = string
  description = "Name of the Lambda function"
  default = "lambda_write_to_sqs"
}
variable "lambda_policy_name" {
    type = string
    description = "Name of added lambda policy for sqs"
    default = "lambda_write_sqs_policy"
}

# ------------------------------------------------------------
# SQS settings
# ------------------------------------------------------------
variable "sqs_name" {
    type = string
    description = "Name of the sqs"
    default = "demo-sqs"
}

variable "Environment_tag_sqs" {
    type = string
    description = "Environment tag value"
    default = "dev"
}
