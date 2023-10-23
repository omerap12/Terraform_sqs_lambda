module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = var.sqs_name

  fifo_queue = true
  content_based_deduplication = true

  tags = {
    Environment = var.Environment_tag_sqs
  }
}