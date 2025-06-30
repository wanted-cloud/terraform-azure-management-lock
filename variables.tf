variable "name" {
  description = "The name of the management lock."
  type        = string
}

variable "scope_id" {
  description = "The scope of the management lock. This can be a resource ID, resource group ID, or subscription ID."
  type        = string
}

variable "lock_level" {
  description = "The level of the management lock. Possible values are 'CanNotDelete' and 'ReadOnly'."
  type        = string
  default     = "CanNotDelete"

  validation {
    condition     = contains(["CanNotDelete", "ReadOnly"], var.lock_level)
    error_message = "lock_level must be either 'CanNotDelete' or 'ReadOnly'."
  }
}

variable "notes" {
  description = "Optional notes for the management lock."
  type        = string
  default     = ""
}