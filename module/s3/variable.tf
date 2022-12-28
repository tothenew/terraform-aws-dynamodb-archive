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