# terraform-aws-template

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

The following content needed to be created and managed:
- Introduction
   - This module will read and filter the data from DynamoDB Stream and write it to AWS Kinesis Firehose Stream. Firehose will further send it to S3 Buckets. 
   - This will archive the old Data in S3 for longer duration. 

# Usages
```
module "dynamodb_archive" {
  source              = "git::https://github.com/tothenew/terraform-aws-dynamodb-archive.git"
  project_name_prefix = "tothenew"
  create_new_bucket   = false
  s3_bucket_name      = "destination-s3-bucket"
  dynamodb_table_name = "dynamodb_table"
}
```

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.
