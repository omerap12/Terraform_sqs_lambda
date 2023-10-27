import json
import boto3
import os
import logging

logger = logging.getLogger(__name__)
client = boto3.client('sqs')

def lambda_handler(event, context):
    try:
        response = client.receive_message(
        QueueUrl=os.environ['sqs'],
        AttributeNames=[
            'SentTimestamp'
        ],
        MaxNumberOfMessages=1,
        MessageAttributeNames=[
            'All'
        ],
        VisibilityTimeout=60,
        WaitTimeSeconds=0
    )

        message = response['Messages'][0]
        receipt_handle = message['ReceiptHandle']
        logger.info(message)
        if message:
            client.delete_message(
                QueueUrl=os.environ['sqs'],
                ReceiptHandle=receipt_handle
            )
            logger.info(f"Delete message {message}")
            return {
                'statusCode': 200,
                'body': json.dumps({'message': 'Messages received and processed successfully'}),
                'message': json.dumps(message)
            }
        else:
            return {
                'statusCode': 200,
                'body': json.dumps({'message': 'No messages'})
            }
    except Exception as e:
        # Handle exceptions
        print(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
