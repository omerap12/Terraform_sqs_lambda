module "write_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.write_lambda_function_name
  description   = var.write_lambda_function_description
  handler       = "lambda_write_sqs.lambda_handler"
  runtime       = "python3.8"
  create_role   = true

  source_path = "../code/lambda_write_sqs.py"

  environment_variables = {
    sqs = module.sqs.queue_id
  }
  tags = {
    Name = var.write_lambda_function_name
  }
  depends_on = [module.sqs]
}

