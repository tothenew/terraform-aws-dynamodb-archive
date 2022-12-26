output "kinesis-firehose-stream-arn" {
  value = module.firehose_stream.kinesis-firehose-stream-arn
}

output "lambda_iam_role_arn" {
  value = module.iam_resources.lambda_aws_role_arn
}

output "firehose_iam_role_arn" {
  value = module.iam_resources.firehose_iam_role_arn
}

output "lambda_iam_policy_arn" {
  value = module.iam_resources.lambda_iam_policy_arn
}

output "firehose_iam_policy_arn" {
  value = module.iam_resources.firehose_iam_policy_arn
}
