/*
 * # wanted-cloud/terraform-azure-management-lock
 * 
 * Terraform building block for locking Azure resources.
 */

resource "azurerm_management_lock" "this" {
  name       = var.name
  scope      = var.scope_id
  lock_level = var.lock_level
  notes      = var.notes

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_management_lock"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_management_lock"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_management_lock"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}