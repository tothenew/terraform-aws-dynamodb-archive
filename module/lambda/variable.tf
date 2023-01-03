variable "lambda_role_arn" {
  type = string
}

variable "kinesis_firehose_stream_name" {
  type        = string
  description = "A string value for Kinesis Firehose Stream Name"
}

variable "lambda_function_name" {
  type        = string
  description = "A string for Lambda Function Name"
}

variable "dynamodb_table_stream_arn" {
  type        = string
  description = "A string for Source DynamoDB Table Stream ARN"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}