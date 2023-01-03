output "kinesis-firehose-stream-arn" {
  value = module.firehose_stream.kinesis-firehose-stream-arn
}

output "lambda_arn" {
  value = module.lambda_archive.lambda_arn
}
