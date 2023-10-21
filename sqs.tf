module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "test-sqs"

  fifo_queue = true
  content_based_deduplication = true

  tags = {
    Environment = "dev"
  }
}