module "role" {
  source = "./role"

  tags = var.tags
}

output "data" {
  value = module.role
}
