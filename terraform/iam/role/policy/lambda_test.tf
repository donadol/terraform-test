data "aws_iam_policy_document" "lambda_test" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda_test" {
  name = "lambda-test-permissions"

  policy = data.aws_iam_policy_document.lambda_test.json
}

output "lambda_test_service" {
  value = aws_iam_policy.lambda_test
}
