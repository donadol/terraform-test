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

resource "aws_iam_role_policy_attachment" "lambda_test" {
  role       = aws_iam_role.lambda_test_role.name
  policy_arn = module.policy.lambda_test_service.arn
}

output "lambda_test_service" {
  value = aws_iam_role.lambda_test_role
}
