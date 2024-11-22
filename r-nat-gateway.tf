resource "azurerm_public_ip" "main" {
  count               = var.public_ip_created ? 1 : 0
  allocation_method   = "Static"
  location            = var.location
  name                = local.public_ip_name
  resource_group_name = var.resource_group_name
  zones               = var.public_ip_zones
  sku                 = "Standard"

  domain_name_label = var.public_ip_domain_name_label
  reverse_fqdn      = var.public_ip_reverse_fqdn

  tags = merge(
    local.default_tags,
    var.extra_tags
  )
}

moved {
  from = azurerm_public_ip.pip[0]
  to   = azurerm_public_ip.main[0]
}

resource "azurerm_nat_gateway" "main" {
  location                = var.location
  name                    = local.name
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = var.idle_timeout

  tags = merge(
    local.default_tags,
    var.extra_tags
  )
}

moved {
  from = azurerm_nat_gateway.natgw
  to   = azurerm_nat_gateway.main
}

resource "azurerm_nat_gateway_public_ip_association" "main" {
  count                = var.public_ip_created ? 1 : 0
  nat_gateway_id       = azurerm_nat_gateway.main.id
  public_ip_address_id = azurerm_public_ip.main[0].id
}

moved {
  from = azurerm_nat_gateway_public_ip_association.pip_assoc[0]
  to   = azurerm_nat_gateway_public_ip_association.main[0]
}

resource "azurerm_nat_gateway_public_ip_association" "custom_ips" {
  for_each             = toset(var.public_ip_ids)
  nat_gateway_id       = azurerm_nat_gateway.main.id
  public_ip_address_id = each.value
}

moved {
  from = azurerm_nat_gateway_public_ip_association.pip_assoc_custom_ips
  to   = azurerm_nat_gateway_public_ip_association.custom_ips
}

resource "azurerm_subnet_nat_gateway_association" "main" {
  for_each       = toset(var.subnet_ids)
  nat_gateway_id = azurerm_nat_gateway.main.id
  subnet_id      = each.value
}

moved {
  from = azurerm_subnet_nat_gateway_association.subnet_assoc
  to   = azurerm_subnet_nat_gateway_association.main
}
