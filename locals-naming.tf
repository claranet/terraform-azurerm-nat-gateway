locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  public_ip_name = coalesce(var.public_ip_custom_name, data.azurecaf_name.pip_nat.result)
  name           = coalesce(var.custom_name, data.azurecaf_name.nat.result)
}
