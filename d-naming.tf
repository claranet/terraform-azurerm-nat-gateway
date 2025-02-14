data "azurecaf_name" "nat" {
  name          = var.stack
  resource_type = "azurerm_public_ip"
  prefixes      = compact([local.name_prefix, "natgw"])
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix])
  use_slug      = false
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "pip_nat" {
  name          = var.stack
  resource_type = "azurerm_public_ip"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, "natgw", local.name_suffix])
  use_slug      = true
  clean_input   = true
  separator     = "-"
}
