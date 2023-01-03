data "template_file" "firehose_iam_policy" {
  template = file("${path.module}/policy.tpl")
  vars = {
    aws_s3_bucket = var.s3_bucket_name
  }
}

resource "aws_iam_policy" "firehose_iam_policy" {
  name        = "${var.firehose_iam_role_name}-policy"
  description = "A policy for Kinesis Firehose to write to S3"
  policy      = data.template_file.firehose_iam_policy.rendered
  tags_all    = merge(var.common_tags, { "Name" = "${var.firehose_iam_role_name}-policy" })
}

resource "aws_iam_role" "firehose_aws_role" {
  name        = "${var.firehose_iam_role_name}-role"
  description = var.firehose_iam_role_description
  tags_all    = var.common_tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = merge(var.common_tags, { "Name" = "${var.firehose_iam_role_name}-role" })
}

resource "aws_iam_role_policy_attachment" "firehose_iam_attach" {
  role       = aws_iam_role.firehose_aws_role.name
  policy_arn = aws_iam_policy.firehose_iam_policy.arn
}
