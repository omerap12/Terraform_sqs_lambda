import json
import boto3
from datetime import datetime
import os

client = boto3.client('sqs')

def lambda_handler(event, context):
    try:
        date_time = datetime.now()
        
        message = client.send_message(
            QueueUrl=os.environ['sqs'],
            MessageBody=("This was sent on: " + str(date_time.strftime('%Y-%m-%d %H:%M:%S'))),
            MessageGroupId='test'
        )
        
        return {
            'statusCode': 200,
            'body': json.dumps(message, indent=2)
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
