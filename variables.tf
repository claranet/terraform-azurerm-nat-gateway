variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "location_short" {
  description = "Short name of Azure region to use"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to use"
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "public_ip_custom_name" {
  description = "Custom name for public IP"
  type        = string
  default     = null
}

variable "public_ip_zones" {
  description = "Public ip Zones to configure."
  type        = list(string)
  default     = null
}

variable "public_ip_ids" {
  description = "List of public ips to use. Create one ip if not provided"
  type        = list(string)
  default     = []
}

variable "public_ip_domain_name_label" {
  description = "DNS domain label for NAT gateway public IP"
  type        = string
  default     = null
}

variable "public_ip_reverse_fqdn" {
  description = "Reverse FQDN for NAT gateway public IP"
  type        = string
  default     = null
}

variable "create_public_ip" {
  description = "Should we create a public IP or not?"
  type        = bool
  default     = true
}

variable "nat_gateway_custom_name" {
  description = "Custom name for Nat gateway"
  type        = string
  default     = null
}

variable "nat_gateway_idle_timeout" {
  description = "Idle timeout configuration in minutes for Nat Gateway"
  type        = number
  default     = 4
}

variable "subnet_ids" {
  description = "Ids of subnets to associate with the Nat Gateway"
  type        = list(string)
}
