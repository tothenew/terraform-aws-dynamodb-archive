locals {
  lambda_iam_role_name         = "${var.project_name_prefix}-dynamodb-archive-lambda"
  lambda_function_name         = "${var.project_name_prefix}-dynamodb-archive"
  firehose_iam_role_name       = "${var.project_name_prefix}-dynamodb-archive-firehose"
  kinesis_firehose_stream_name = "${var.project_name_prefix}-dynamodb-archive-s3"
  dynamoDB_stream_name         = data.aws_dynamodb_table.dynamoDB_table.arn
}
