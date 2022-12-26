module "dynamodb_archive" {
  source              = "git::https://github.com/bishtmaniish/terraform-aws-dynamodb-archive.git"
  project_name_prefix = "tothenew"
  kinesis_firehose_stream_name = "dynamodb_archive_s3"
  s3_bucket_name ="destination-s3-bucket"
  lambda_iam_role_name = "lambda_role"
  firehose_iam_role_name = "firehose_role"
  lambda_function_name = "write_to_kinesis"
  dynamodb_table_stream_arn = "arn:aws:dynamodb:us-west-1:1234567890:table/dynamodb_table/stream/2022-12-15T00:00:11.804""
}
