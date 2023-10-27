# ------------------------------------------------------------
# Lambda settings
# ------------------------------------------------------------
variable "write_lambda_function_name" {
  type = string
  description = "Name of the Lambda function (write)"
  default = "lambda_write_to_sqs"
}
variable "read_lambda_function_name" {
  type = string
  description = "Name of the Lambda function (read)"
  default = "lambda_read_to_sqs"
}
variable "write_lambda_policy_name" {
    type = string
    description = "Name of added lambda policy for sqs (write)"
    default = "lambda_write_sqs_policy"
}
variable "read_lambda_policy_name" {
    type = string
    description = "Name of added lambda policy for sqs (read)"
    default = "lambda_read_sqs_policy"

}
variable "write_lambda_function_description" {
  type = string
  description = "Description for write lambda function"
  default = "Write from SQS lambda"
}
variable "read_lambda_function_description" {
  type = string
  description = "Description for read lambda function"
  default = "Read from SQS lambda"
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
