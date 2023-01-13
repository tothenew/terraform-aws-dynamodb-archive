
## IAM Resources ##
module "s3" {
  source         = "./module/s3"
  count          = var.create_new_bucket ? 1 : 0
  s3_bucket_name = var.s3_bucket_name
  common_tags    = var.common_tags
}

module "firehose_iam" {
  source                 = "./module/iam/firehose"
  firehose_iam_role_name = local.firehose_iam_role_name
  s3_bucket_name         = var.s3_bucket_name
  common_tags            = var.common_tags
}

## Kinesis Resources ##
module "firehose_stream" {
  source                       = "./module/kinesis"
  firehose_aws_role            = module.firehose_iam.firehose_iam_role_arn
  s3_bucket_name               = var.create_new_bucket ? module.s3[0].s3_bucket_name : var.s3_bucket_name
  kinesis_firehose_stream_name = local.kinesis_firehose_stream_name
  common_tags                  = var.common_tags
}

module "lambda_iam" {
  source               = "./module/iam/lambda"
  lambda_iam_role_name = local.lambda_iam_role_name
  dynamoDB_stream_arn  = local.dynamoDB_stream_name
  firehose_stream_name = local.kinesis_firehose_stream_name
  common_tags          = var.common_tags
}

## Lambda Function ##
module "lambda_archive" {
  source                       = "./module/lambda"
  lambda_function_name         = local.lambda_function_name
  kinesis_firehose_stream_name = local.kinesis_firehose_stream_name
  lambda_role_arn              = module.lambda_iam.lambda_aws_role_arn
  dynamodb_table_stream_arn    = data.aws_dynamodb_table.dynamoDB_table.stream_arn
  common_tags                  = var.common_tags
}

