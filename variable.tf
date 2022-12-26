variable "project_name_prefix" {
  type        = string
  default     = "tothenew"
  description = "A string value to describe prefix of all the resources"
}

variable "kinesis_firehose_stream_name" {
  type        = string
  description = "A string value for Kinesis Firehose Stream Name"
}

variable "s3_bucket_name" {
  type        = string
  description = "A string value for Destination S3 Bucket"
}

variable "lambda_iam_role_name" {
  type        = string
  description = "A string value for Lambda IAM Role Name"
}

variable "firehose_iam_role_name" {
  type        = string
  description = "A string value for Kinesis IAM Role Name"
}

variable "firehose_iam_role_description" {
  default     = "Access to S3 Bucket"
  type        = string
  description = "A string value for Kinesis IAM Role Description"
}

variable "common_tags" {
  default = {
    "Project" : "ToTheNew"
  }
  type        = map(string)
  description = "A map to add common tags to all the resources"
}

variable "lambda_function_name" {
  type        = string
  description = "A string for Lambda Function Name"
}

variable "dynamodb_table_name" {
  type        = string
  description = "A string for Source DynamoDB Table Name"
}



