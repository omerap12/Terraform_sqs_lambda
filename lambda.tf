module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "test_lambda"
  description   = "Test sending sqs messages"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  create_role   = true

  source_path = "lambda_function.py"

  environment_variables = {
    sqs = module.sqs.queue_id
  }
  tags = {
    Name = "test_lambda"
  }
  depends_on = [module.sqs]
}

