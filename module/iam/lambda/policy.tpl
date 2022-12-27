{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                    "firehose:DescribeDeliveryStream",
                    "firehose:DeleteDeliveryStream",
                    "firehose:PutRecord",
                    "firehose:StartDeliveryStreamEncryption",
                    "firehose:CreateDeliveryStream",
                    "firehose:PutRecordBatch",
                    "firehose:StopDeliveryStreamEncryption",
                    "firehose:UpdateDestination"
                    ],
            "Resource": "arn:aws:firehose:${region_name}:${account_id}:deliverystream/${firehose_stream_name}"
        },
        {
            "Effect": "Allow",
            "Action": [
                  "logs:CreateLogGroup",
                  "logs:CreateLogStream",
                  "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                  "dynamodb:GetShardIterator",
                  "dynamodb:DescribeStream",
                  "dynamodb:ListStreams",
                  "dynamodb:GetRecords"
              ],
            "Resource": "${dynamoDB_stream_arn}"
      }
    ]
}