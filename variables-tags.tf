variable "default_tags_enabled" {
  description = "Option to enable or disable default tag."
  type        = bool
  default     = true
}

variable "extra_tags" {
  description = "Extra tags to add."
  type        = map(string)
  default     = {}
}
