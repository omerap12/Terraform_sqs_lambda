resource "aws_iam_policy" "write_lambda_policy" {
  name        = var.write_lambda_function_name
  description = "Policy that allows lambda access to sqs"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "VisualEditor0",
      Effect = "Allow",
      Action = [
        "sqs:SendMessage",
        "sqs:GetQueueAttributes"
      ],
      Resource = module.sqs.queue_arn
    }]
  })
  depends_on = [module.sqs]

}

resource "aws_iam_role_policy_attachment" "attach_lambda_role_write" {
  role       = module.write_lambda_function.lambda_role_name
  policy_arn = aws_iam_policy.write_lambda_policy.arn
  depends_on = [module.write_lambda_function]
}