locals {
  tags = {
    Product = var.product
  }
}

module "sns" {
  source = "./sns"

  tags = local.tags
}
