output "lambda_aws_role_arn" {
  value = aws_iam_role.lambda_aws_role.arn
}

output "lambda_iam_policy_arn" {
  value = aws_iam_policy.lambda_iam_policy.arn
}
