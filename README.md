# Azure NAT Gateway

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/nat-gateway/azurerm/)

Common Azure terraform module to create a nat gateway and do the association with subnet(s).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl

module "azure_network_vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  stack               = var.stack
  resource_group_name = module.rg.name

  cidrs = ["10.0.1.0/24"]
}

module "azure_network_subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  stack               = var.stack
  resource_group_name = module.rg.name

  virtual_network_name = module.azure_network_vnet.name
  cidrs                = ["10.0.1.0/26"]
}

module "nat_gateway" {
  source  = "claranet/nat-gateway/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  stack               = var.stack
  resource_group_name = module.rg.name

  subnet_ids = [module.azure_network_subnet.id]
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.custom_ips](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_nat_gateway_public_ip_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet_nat_gateway_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |
| [azurecaf_name.nat](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.pip_nat](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Custom name for Nat Gateway. | `string` | `null` | no |
| default\_tags\_enabled | Option to enable or disable default tag. | `bool` | `true` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Extra tags to add. | `map(string)` | `{}` | no |
| idle\_timeout | Idle timeout configuration in minutes for Nat Gateway. | `number` | `4` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short name of Azure region to use. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| public\_ip\_created | Whether to create a public IP or not. | `bool` | `true` | no |
| public\_ip\_custom\_name | Custom name for public IP. | `string` | `null` | no |
| public\_ip\_domain\_name\_label | DNS domain label for Nat Gateway public IP. | `string` | `null` | no |
| public\_ip\_ids | List of public IPs to use. Create one IP if not provided. | `list(string)` | `[]` | no |
| public\_ip\_reverse\_fqdn | Reverse FQDN for Nat Gateway public IP. | `string` | `null` | no |
| public\_ip\_zones | Public IP zones to configure. | `list(string)` | `null` | no |
| resource\_group\_name | Name of the resource group to use. | `string` | n/a | yes |
| stack | Project stack name. | `string` | n/a | yes |
| subnet\_ids | IDs of subnets to associate with the Nat Gateway. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Nat Gateway ID. |
| name | Nat Gateway name. |
| public\_ip\_ids | IDs of public IPs. |
| public\_ips\_adresses | Public IPs addresses associated to Nat Gateway. |
| resource | Nat Gateway resource object. |
| resource\_public\_ips | Public IPs resources list object. |
<!-- END_TF_DOCS -->
## Related documentation

Azure NAT Gateway documentation: [docs.microsoft.com/en-us/azure/virtual-network/nat-gateway-resource](https://docs.microsoft.com/en-us/azure/virtual-network/nat-gateway-resource)

Azure public IP documentation: [docs.microsoft.com/en-us/azure/virtual-network/public-ip-addresses](https://docs.microsoft.com/en-us/azure/virtual-network/public-ip-addresses)
