
# AWS Lambda Function for Sending SQS Messages

his Terraform configuration deploys an AWS Lambda function (test_lambda) that sends messages to an SQS (Simple Queue Service) queue named test-sqs. The Lambda function is triggered manually and demonstrates how to send a message to an SQS queue using Python and the Boto3 AWS SDK. The Terraform modules used here create the necessary AWS resources and manage their configurations.

## Prerequisites
Before you begin, ensure you have:

AWS credentials configured locally with appropriate permissions.
Terraform installed on your system.

## Files Included
* main.tf: Defines the AWS resources using Terraform configurations.
* lambda_function.py: Python code for the Lambda function, which sends a message to the SQS queue.
* variables.tf: Contains input variables used in the Terraform configuration.
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