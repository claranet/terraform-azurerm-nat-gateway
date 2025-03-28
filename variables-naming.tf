# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name."
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name."
  type        = string
  default     = ""
}

# Custom naming override
variable "custom_name" {
  description = "Custom name for Nat Gateway."
  type        = string
  default     = null
}

variable "public_ip_custom_name" {
  description = "Custom name for public IP."
  type        = string
  default     = null
}
