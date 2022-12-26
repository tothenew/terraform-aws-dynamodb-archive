resource "aws_kinesis_firehose_delivery_stream" "kinesis_firehose_stream" {
  name        = "${var.kinesis_firehose_stream_name}-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn            = var.firehose_aws_role
    bucket_arn          = "arn:aws:s3:::${var.s3_bucket_name}"
    buffer_interval     = 60
    error_output_prefix = "error/"
    cloudwatch_logging_options {
      enabled = true
      log_group_name = aws_cloudwatch_log_group.kinesis_log_group.name
      log_stream_name = "transaction_logs"
    }
  }
  tags_all = merge(var.common_tags, {"Name"="${var.kinesis_firehose_stream_name}-stream"})
}

resource "aws_cloudwatch_log_group" "kinesis_log_group" {
  name              = "/aws/kinesis/${var.kinesis_firehose_stream_name}-stream"
  retention_in_days = 7
  tags              = merge(var.common_tags, {"Name" = "${var.kinesis_firehose_stream_name}-stream"})
}