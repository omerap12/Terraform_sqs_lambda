
# AWS Lambda Function for Sending SQS Messages

This Terraform configuration is designed to deploy two AWS Lambda functions, namely `lambda_write_sqs.py` and `lambda_read_sqs.py`, which are responsible for sending and receiving messages to and from an AWS FIFO SQS (Simple Queue Service). These Lambda functions showcase the process of manually triggering events and demonstrate how to exchange messages with an SQS queue using Python and the Boto3 AWS SDK. The configuration utilizes Terraform modules to create essential AWS resources and handle their configurations effectively.

## Prerequisites
Before you begin, ensure you have:

AWS credentials configured locally with appropriate permissions.
Terraform installed on your system.

## Files Included
### Code:
* lambda_write_sqs.py: Python code for the Lambda function, sending messages to the SQS queue.
* lambda_read_sqs.py:  Python code for the Lambda function, receiving messages from the SQS queue.

### Terraform:
* sqs.tf: Defines the creation of the SQS FIFO queue.
* write_sqs_lambda.tf: Terraform configuration for the Lambda function responsible for sending messages to SQS.
* write_policy.tf: Terraform configuration for the permission policies associated with the Lambda function sending messages.
* read_sqs_lambda.tf: Terraform configuration for the Lambda function responsible for receiving messages from SQS.
* read_policy.tf: Terraform configuration for the permission policies associated with the Lambda function receiving messages.
* variables.tf:  Input variables used in the Terraform configuration.
* outputs.tf: Specifies the outputs of the Terraform configuration.

## How to Use
1. Clone the Repository:
```
git clone https://github.com/omerap12/Terraform_sqs_lambda.git
cd Terraform_sqs_lambda
```
2. Set Up Terraform:
```
terraform init
```
3. Configure Variables : Modify variables.tf to adjust the variables according to your requirements, such as function name, queue name, and AWS region.  
4. Deploy AWS Resources: Apply the Terraform configuration to create the Lambda function, SQS queue, and necessary IAM policies
```
terraform apply
```
5. Invoke the Lambda Function: After successful deployment, manually invoke the Lambda function to send a message to the SQS queue.
6. Clean Up: If you want to remove the deployed resources, run:
```
terraform destroy
```
