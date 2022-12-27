locals {
  dynamoDB_stream_name = data.aws_dynamodb_table.dynamoDB_table.arn
}
