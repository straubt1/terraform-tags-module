
module "tags-tfe" {
  source   = "./common_tags"
  app_code = "TFE"
}

module "tags-tab" {
  source   = "./common_tags"
  app_code = "TAB"
}

module "tags-unknown" {
  source   = "./common_tags"
  app_code = "UNKNOWN"
}

output "required_tags" {
  value = {
    tfe     = module.tags-tfe.required_tags
    tab     = module.tags-tab.required_tags
    unknown = module.tags-unknown.required_tags
  }
}

