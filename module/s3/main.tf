resource "aws_s3_bucket" "bucket" {
  bucket   = var.s3_bucket_name
  tags_all = merge(var.common_tags, { "Name" = var.s3_bucket_name })
}
