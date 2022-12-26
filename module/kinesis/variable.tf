variable "kinesis_firehose_stream_name" {
  #default = "transaction-logs"
  type        = string
  description = "A string value for Kinesis Firehose Stream Name"
}

variable "s3_bucket_name" {
  #default = "s3-bucket-dynamodb-transaction-archive"
  type        = string
  description = "A string value for Destination S3 Bucket"
}

variable "firehose_aws_role" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}
