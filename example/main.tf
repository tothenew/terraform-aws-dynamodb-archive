module "dynamodb_archive" {
  source              = "git::https://github.com/bishtmaniish/terraform-aws-dynamodb-archive.git"
  project_name_prefix = "tothenew"
  create_new_bucket   = false
  s3_bucket_name      = "destination-s3-bucket"
  dynamodb_table_name = "dynamodb_table"
}
