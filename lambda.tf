module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.lambda_function_name
  description   = "Test sending sqs messages"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  create_role   = true

  source_path = "lambda_function.py"

  environment_variables = {
    sqs = module.sqs.queue_id
  }
  tags = {
    Name = var.lambda_function_name
  }
  depends_on = [module.sqs]
}

