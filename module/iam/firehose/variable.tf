variable "s3_bucket_name" {
  type        = string
  description = "A string value for Destination S3 Bucket"
}

variable "firehose_iam_role_name" {
  type        = string
  description = "A string value for Kinesis IAM Role Name"
}

variable "firehose_iam_role_description" {
  type        = string
  default     = "Allow Firehose Stream to access S3 Bucket"
  description = "A string value for Kinesis IAM Role Description"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}