module "s3" {
  for_each = var.participants
  source   = "./modules/s3"
  domain   = each.value
  tags     = local.tags
}