data "archive_file" "lambda_test" {
  type        = "zip"
  source_dir  = "../lambda_test"
  output_path = "lambda_test.zip"
}

resource "aws_lambda_function" "lambda_test" {
  filename         = data.archive_file.lambda_test.output_path
  function_name    = "lambda-test-function"
  role             = var.iam_module.lambda_test_service.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_test.output_base64sha256
  runtime          = "nodejs20.x"
  timeout          = 5
  memory_size      = 128

  tags = var.tags

}
