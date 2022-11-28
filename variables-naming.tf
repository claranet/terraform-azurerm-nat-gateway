# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_caf_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `nat_gateway_custom_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Custom naming override
variable "nat_gateway_custom_name" {
  description = "Custom name for Nat gateway"
  type        = string
  default     = null
}

variable "public_ip_custom_name" {
  description = "Custom name for public IP"
  type        = string
  default     = null
}
