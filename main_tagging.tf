locals {
  common_tags        = module.root_tags.tags
  common_name_prefix = var.team-name
}

resource "random_string" "random_name" {
  count   = var.team-name != "" ? 0 : 1
  length  = 6
  special = false
}

locals {
  team-name = var.team-name != "" ? var.team-name : lower(join("-", random_string.random_name.*.result))
}

module "root_tags" {
  source    = "git::https://github.com/cloudposse/terraform-null-label?ref=tags/0.15.0"
  namespace = "es"
  name      = local.common_name_prefix
  delimiter = "-"

  tags = {
    Team      = "EconStats"
    ManagedBy = "Terraform"
  }
}
