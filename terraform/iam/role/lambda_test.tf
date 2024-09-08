data "aws_iam_policy_document" "lambda_test_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_test_role" {
  name               = "lambda-test-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_test_assume_role.json
  tags               = var.tags
}

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

resource "aws_iam_role_policy_attachment" "lambda_test" {
  count = 1

  role       = aws_iam_role.lambda_test_role.name
  policy_arn = aws_iam_policy.lambda_test.arn
}

output "lambda_test_service" {
  value = aws_iam_role.lambda_test_role
}
