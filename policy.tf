resource "aws_iam_policy" "lambda_policy" {
  name        = "Lambda_sqs_policy"
  description = "Policy that allows lambda access to sqs"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "VisualEditor0",
      Effect = "Allow",
      Action = [
        "sqs:ReceiveMessage",
        "sqs:SendMessage",
        "sqs:GetQueueAttributes"
      ],
      Resource = module.sqs.queue_arn
    }]
  })
  depends_on = [module.sqs]

}

resource "aws_iam_role_policy_attachment" "attach_lambda_role" {
  role       = module.lambda_function.lambda_role_name
  policy_arn = aws_iam_policy.lambda_policy.arn
  depends_on = [module.lambda_function]

}