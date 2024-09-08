terraform {
  backend "s3" {
    bucket         = "ldonado-state-files"
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
