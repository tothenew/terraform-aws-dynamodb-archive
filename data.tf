data "aws_dynamodb_table" "dynamoDB_table" {
  name = var.dynamodb_table_name
}
