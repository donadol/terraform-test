resource "aws_sns_topic" "sns_test" {
  name = "sns-test"
  tags = var.tags
}

output "sns_test" {
  value = aws_sns_topic.sns_test
}
