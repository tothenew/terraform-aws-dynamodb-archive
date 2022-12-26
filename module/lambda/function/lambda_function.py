import boto3
import botocore
import json
import logging
import os
import time
from datetime import datetime

logger = logging.getLogger()
logger.setLevel(logging.INFO)

DeliveryStreamName = os.environ["KINESIS_FIRESHOSE_STREAM"]

session = boto3.Session()
firehose_client = session.client('firehose')
def lambda_handler(event, context):
    logging.info("Start!!")
    logging.info(event)
    logging.info(context)
    data_records = event['Records']
    if not len(data_records):
        logging.info("No Records Found")
        return {
            "status" : True
        }
    archived_log =  []
    for record in data_records:
        if record["eventName"] == "REMOVE" and record.get("userIdentity" , None):
            if record['userIdentity'].get("principalId") == "dynamodb.amazonaws.com" and record['userIdentity'].get("type") == "Service":
                record['timestamp'] = int(time.time())
                if record['dynamodb'].get('OldImage', None):
                    archived_log.append({'Data': json.dumps(record['dynamodb']['OldImage']) + "\n" })
                    logging.info(record)
    logging.info(archived_log)
    if not len(archived_log):
        logging.info("No Valid Records Found")
        return {
            "status" : True
        }
    try:
        response = firehose_client.put_record_batch(DeliveryStreamName = DeliveryStreamName, Records  = archived_log)
        logging.info(response)
    except botocore.exceptions.ClientError as error:
        logging.info("Error while putting data")
        logging.info(error)
        return {
            'status': False
        }
    return {
            'status': True
        }
