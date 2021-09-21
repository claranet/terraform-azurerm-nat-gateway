module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "azure_network_vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  vnet_cidr = ["10.0.1.0/24"]
}

module "azure_network_subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  virtual_network_name = module.azure_network_vnet.virtual_network_name
  subnet_cidr_list     = ["10.0.1.0/26"]
}

module "nat_gateway" {
  source  = "claranet/nat-gateway/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  subnet_ids = [module.azure_network_subnet.subnet_id]
}
