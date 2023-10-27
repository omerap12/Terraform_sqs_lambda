module "read_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.read_lambda_function_name
  description   = var.read_lambda_function_description
  handler       = "lambda_read_sqs.lambda_handler"
  runtime       = "python3.8"
  create_role   = true

  source_path = "../code/lambda_read_sqs.py"

  environment_variables = {
    sqs = module.sqs.queue_id
  }
  tags = {
    Name = var.read_lambda_function_name
  }
  depends_on = [module.sqs]
}

