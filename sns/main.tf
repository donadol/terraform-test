module "topics" {
  source = "./topics"

  tags = var.tags
}

output "data" {
  value = module.topics
}
