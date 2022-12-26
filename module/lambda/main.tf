data "archive_file" "archive_function_obj" {
  type        = "zip"
  source_dir  = "${path.module}/function"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.lambda_function_name}-function"
  filename = "${path.module}/lambda_function.zip"
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.archive_function_obj.output_base64sha256
  runtime       = "python3.9"
  timeout       = "30"
  description   = "Function to Put data into Stream"

  environment {
    variables = {
      KINESIS_FIRESHOSE_STREAM     = var.kinesis_firehose_stream_name
    }
  }

  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.lambda_function_name}-function"
    })
  )
}

resource "aws_cloudwatch_log_group" "cw_lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_function.function_name}"
  retention_in_days = 7
  tags              = merge(var.common_tags, {"Name" = "${var.lambda_function_name}-function"} )
}

resource "aws_lambda_event_source_mapping" "lambda_trigger" {
  event_source_arn  = var.dynamodb_table_stream_arn
  function_name     = aws_lambda_function.lambda_function.arn
  starting_position = "LATEST"
}