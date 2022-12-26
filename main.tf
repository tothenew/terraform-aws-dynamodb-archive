
data "aws_region" "current" {
}

## IAM Resources ##
module "iam_resources" {
  source                        = "./module/iam"
  lambda_iam_role_name          = var.lambda_iam_role_name
  firehose_iam_role_name        = var.firehose_iam_role_name
  s3_bucket_name                = var.s3_bucket_name
  common_tags                   = var.common_tags
}
## Kinesis Resources ##
module "firehose_stream" {
  source                       = "./module/kinesis"
  firehose_aws_role            = module.iam_resources.firehose_iam_role_arn
  s3_bucket_name               = var.s3_bucket_name
  kinesis_firehose_stream_name = var.kinesis_firehose_stream_name
  common_tags                  = var.common_tags
}
## Lambda Function ##
module "lambda_archive" {
  source                       = "./module/lambda"
  lambda_function_name         = var.lambda_function_name
  kinesis_firehose_stream_name = var.kinesis_firehose_stream_name
  lambda_role_arn              = module.iam_resources.lambda_aws_role_arn
  dynamodb_table_stream_arn    = var.dynamodb_table_stream_arn
  common_tags                  = var.common_tags
}

