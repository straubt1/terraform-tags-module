locals {
  data = jsondecode(file(format("%s/app_config.json", path.module)))

  # Attempt a lookup by app_code and environment, if not found, return empty map
  data_lookup = try([for i in local.data : i if i.app_code == var.app_code][0], {})

  # If desired, ignore the try() and just fail if not found
  # data_lookup = [for i in local.data : i if i.app_code == var.app_code][0]
}

variable "app_code" {
  description = "Application Code - Primary key for looking up tags."
}

output "required_tags" {
  value = local.data_lookup
}
