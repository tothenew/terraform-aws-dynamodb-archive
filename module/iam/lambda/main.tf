# Lambda #

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "template_file" "lambda_iam_policy" {
  template = file("${path.module}/policy.tpl")
  vars = {
    account_id           = data.aws_caller_identity.current.account_id
    region_name          = data.aws_region.current.name
    firehose_stream_name = var.firehose_stream_name
    dynamoDB_stream_arn  = var.dynamoDB_stream_arn
  }
}

resource "aws_iam_policy" "lambda_iam_policy" {
  name        = "${var.lambda_iam_role_name}-lambda-policy"
  description = "A policy to allow Lambda to Write to Kinesis Firehose"
  policy      = data.template_file.lambda_iam_policy.rendered
  tags_all    = merge(var.common_tags, { "Name" = "${var.lambda_iam_role_name}-lambda-policy" })
}

resource "aws_iam_role" "lambda_aws_role" {
  name        = "${var.lambda_iam_role_name}-role"
  description = var.lambda_iam_role_description
  tags_all    = var.common_tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = merge(var.common_tags, { "Name" = "${var.lambda_iam_role_name}-role" })
}

resource "aws_iam_role_policy_attachment" "lambda_iam_attach" {
  role       = aws_iam_role.lambda_aws_role.name
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_iam_attach_basic_policy" {
  role       = aws_iam_role.lambda_aws_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}