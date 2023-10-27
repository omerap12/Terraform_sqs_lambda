resource "aws_iam_policy" "read_lambda_policy" {
  name        = var.read_lambda_policy_name
  description = "Policy that allows lambda access to sqs"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "VisualEditor0",
      Effect = "Allow",
      Action = [
        "sqs:ReceiveMessage",
        "sqs:GetQueueAttributes",
        "sqs:DeleteMessage"
      ],
      Resource = module.sqs.queue_arn
    }]
  })
  depends_on = [module.sqs]

}

resource "aws_iam_role_policy_attachment" "attach_lambda_role_read" {
  role       = module.read_lambda_function.lambda_role_name
  policy_arn = aws_iam_policy.read_lambda_policy.arn
  depends_on = [module.read_lambda_function]
}