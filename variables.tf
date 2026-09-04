variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short name of Azure region to use."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to use."
  type        = string
}

variable "sku_name" {
  description = "SKU of the Nat Gateway. Possible values are `Standard` and `StandardV2`. A `StandardV2` Nat Gateway is zone-redundant and requires `StandardV2` public IPs."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "StandardV2"], var.sku_name)
    error_message = "`sku_name` must be either `Standard` or `StandardV2`."
  }
}

variable "public_ip_zones" {
  description = "Public IP zones to configure."
  type        = list(string)
  default     = null
}

variable "public_ip_sku" {
  description = "SKU of the created public IP. Defaults to the Nat Gateway `sku_name`, which is the only supported combination."
  type        = string
  default     = null

  validation {
    condition     = var.public_ip_sku == null || contains(["Standard", "StandardV2"], var.public_ip_sku)
    error_message = "`public_ip_sku` must be either `Standard` or `StandardV2`."
  }
}

variable "public_ip_ids" {
  description = "List of public IPs to use. Create one IP if not provided."
  type        = list(string)
  default     = []
}

variable "public_ip_domain_name_label" {
  description = "DNS domain label for Nat Gateway public IP."
  type        = string
  default     = null
}

variable "public_ip_reverse_fqdn" {
  description = "Reverse FQDN for Nat Gateway public IP."
  type        = string
  default     = null
}

variable "public_ip_created" {
  description = "Whether to create a public IP or not."
  type        = bool
  default     = true
}

variable "idle_timeout" {
  description = "Idle timeout configuration in minutes for Nat Gateway."
  type        = number
  default     = 4
}

variable "subnet_ids" {
  description = "IDs of subnets to associate with the Nat Gateway."
  type        = list(string)
}
