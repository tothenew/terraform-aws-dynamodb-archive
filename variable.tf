variable "project_name_prefix" {
  type        = string
  default     = "tothenew"
  description = "A string value to describe prefix of all the resources"
}

variable "create_new_bucket" {
  type        = bool
  description = "A Variable to choose if new bucket is to be created or not."
}

variable "s3_bucket_name" {
  type        = string
  description = "A string value for Destination S3 Bucket"
}

variable "common_tags" {
  default = {
    "Project" : "ToTheNew"
  }
  type        = map(string)
  description = "A map to add common tags to all the resources"
}

variable "dynamodb_table_name" {
  type        = string
  description = "A string for Source DynamoDB Table Name"
}



