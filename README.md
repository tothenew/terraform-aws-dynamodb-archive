# terraform-aws-dynamodb-archive

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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firehose_iam"></a> [firehose\_iam](#module\_firehose\_iam) | ./module/iam/firehose | n/a |
| <a name="module_firehose_stream"></a> [firehose\_stream](#module\_firehose\_stream) | ./module/kinesis | n/a |
| <a name="module_lambda_archive"></a> [lambda\_archive](#module\_lambda\_archive) | ./module/lambda | n/a |
| <a name="module_lambda_iam"></a> [lambda\_iam](#module\_lambda\_iam) | ./module/iam/lambda | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./module/s3 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.dynamoDB_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/dynamodb_table) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map to add common tags to all the resources | `map(string)` | <pre>{<br>  "Project": "ToTheNew"<br>}</pre> | no |
| <a name="input_create_new_bucket"></a> [create\_new\_bucket](#input\_create\_new\_bucket) | A Variable to choose if new bucket is to be created(true/false). | `bool` | n/a | yes |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | A string for Source DynamoDB Table Name | `string` | n/a | yes |
| <a name="input_project_name_prefix"></a> [project\_name\_prefix](#input\_project\_name\_prefix) | A string value to describe prefix of all the resources | `string` | `"tothenew"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | A string value for Destination S3 Bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesis-firehose-stream-arn"></a> [kinesis-firehose-stream-arn](#output\_kinesis-firehose-stream-arn) | n/a |
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | n/a |
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.
