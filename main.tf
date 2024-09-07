resource "aws_sns_topic" "test_sns" {
  name = "sns-test"

  tags = {
    Name = var.product
  }
}
