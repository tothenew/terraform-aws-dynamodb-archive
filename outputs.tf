output "kinesis-firehose-stream-arn" {
  value = module.firehose_stream.kinesis-firehose-stream-arn
}

output "lambda_iam_role_arn" {
  value = module.lambda_iam.lambda_aws_role_arn
}

output "firehose_iam_role_arn" {
  value = module.firehose_iam.firehose_iam_role_arn
}
