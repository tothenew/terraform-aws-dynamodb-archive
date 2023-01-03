variable "lambda_iam_role_name" {
  type        = string
  description = "A string value for Lambda IAM Role Name"
}

variable "lambda_iam_role_description" {
  type        = string
  default     = "Allow Lambda to access Kinesis Firhose Stream and DynamoDB Stream"
  description = "A string value for Lambda IAM Role Description"
}

variable "firehose_stream_name" {
  type        = string
  description = "A string value for Kinesis Firehose Stream Name"
}

variable "dynamoDB_stream_arn" {
  type        = string
  description = "A string value DynamoDB Stream ARN"
}
variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}