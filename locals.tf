locals {
  name_prefix       = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0_9]$/", "$0-") : ""
  default_base_name = format("%s%s-%s-%s-%s", local.name_prefix, var.stack, var.client_name, var.location_short, var.environment)

  public_ip_name   = coalesce(var.public_ip_custom_name, format("%s-pip", local.default_base_name))
  nat_gateway_name = coalesce(var.nat_gateway_custom_name, format("%s-natgw", local.default_base_name))

  default_tags = {
    env   = var.environment
    stack = var.stack
  }
}
