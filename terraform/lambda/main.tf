module "functions" {
  source = "./functions"

  tags       = var.tags
  iam_module = var.iam_module
}

output "data" {
  value = module.functions
}
