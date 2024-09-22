locals {
  tags = {
    Product = var.product
  }
}

module "iam" {
  source = "./iam"

  tags = local.tags
}

module "lambda" {
  source = "./lambda"

  tags       = local.tags
  iam_module = module.iam.data
}

module "sns" {
  source = "./sns"

  tags = local.tags
}

module "apigateway" {
  source = "./apigateway"

  lambda_module = module.lambda.data
}
