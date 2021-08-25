# Azure NAT Gateway

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/nat-gateway/azurerm/)

Common Azure terraform module to create a nat gateway and do the association with subnet(s).

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | 0.15.x & 1.0.x    | >= 2.12         |
| >= 4.x.x       | 0.13.x            | >= 2.12         |
| >= 3.x.x       | 0.12.x            | >= 2.12         |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
locals {
  network_security_group_names = ["nsg1", "nsg2", "nsg3"]

  vnet_cidr = "10.0.1.0/24"

  subnets = [
    {
      name              = "subnet1"
      cidr              = ["10.0.1.0/26"]
      vnet_name         = module.azure-network-vnet.virtual_network_name

    },
    {
      name              = "subnet2"
      cidr              = ["10.0.1.64/26"]
      vnet_name         = module.azure-network-vnet.virtual_network_name
    }
  ]
}
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}


module "azure-network-subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  for_each = { for subnet in local.subnets : subnet.name => subnet }

  environment         = var.environment
  location_short      = module.azure-region.location_short
  client_name         = var.client_name
  stack               = var.stack
  custom_subnet_name  = each.key

  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = each.value.vnet_name
  subnet_cidr_list     = each.value.cidr

}

module "azure-network-vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment      = var.environment
  location         = module.azure-region.location
  location_short   = module.azure-region.location_short
  client_name      = var.client_name
  stack            = var.stack
  custom_vnet_name = var.custom_vnet_name

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = [local.vnet_cidr]
}

module "nat-gateway" {
  source  = "claranet/nat-gateway/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
  resource_group_name = module.rg.resource_group_name
  stack               = var.stack
  subnet_ids          = [module.azure-network-subnet["subnet2"].subnet_id]
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_nat_gateway.natgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.pip-assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_nat_gateway_public_ip_association.pip-assoc-custom-ips](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet_nat_gateway_association.subnet-assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| create\_public\_ip | Should we create a public IP or not? | `bool` | `true` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| location\_short | Short name of Azure region to use | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| nat\_gateway\_custom\_name | Custom name for Nat gateway | `string` | `null` | no |
| nat\_gateway\_idle\_timeout | Idle timeout configuration in minutes for Nat Gateway | `number` | `4` | no |
| public\_ip\_custom\_name | Custom name for public IP | `string` | `null` | no |
| public\_ip\_ids | List of public ips to use. Create one ip if not provided | `list(string)` | `[]` | no |
| public\_ip\_zones | Public ip Zones to configure. | `list(string)` | `null` | no |
| resource\_group\_name | Name of the resource group to use | `string` | n/a | yes |
| stack | Project stack name | `string` | n/a | yes |
| subnet\_ids | Ids of subnets to associate with the Nat Gateway | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_id | Nat Gateway Id |
| nat\_gateway\_name | Nat gateway Name |
| nat\_gateway\_public\_ip\_ids | Id of public IPs |
| nat\_gateway\_public\_ips | Public IPs associated to Nat Gateway |
<!-- END_TF_DOCS -->
## Related documentation

Azure NAT Gateway documentation: [docs.microsoft.com/en-us/azure/virtual-network/nat-gateway-resource](https://docs.microsoft.com/en-us/azure/virtual-network/nat-gateway-resource)

Azure public IP documentation: [docs.microsoft.com/en-us/azure/virtual-network/public-ip-addresses](https://docs.microsoft.com/en-us/azure/virtual-network/public-ip-addresses)
