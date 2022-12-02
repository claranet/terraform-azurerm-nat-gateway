data "azurecaf_name" "nat" {
  name          = var.stack
  resource_type = "azurerm_public_ip"
  prefixes      = compact([var.use_caf_naming ? "natgw" : "", local.name_prefix])
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, var.use_caf_naming ? "" : "natgw"])
  use_slug      = false
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "pip_nat" {
  name          = var.stack
  resource_type = "azurerm_public_ip"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, var.use_caf_naming ? "" : "pip"])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}
