data "azurerm_client_config" "current" {}

module "template" {
    source = "../.."

    name = "example-lock"
    scope_id = data.azurerm_client_config.current.subscription_id
}