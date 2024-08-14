provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "api_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_api_management" "api_mgmt" {
  name                = var.api_management_name
  location            = azurerm_resource_group.api_rg.location
  resource_group_name = azurerm_resource_group.api_rg.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_api_management_api" "api" {
  name                = var.api_name
  resource_group_name = azurerm_resource_group.api_rg.name
  api_management_name = azurerm_api_management.api_mgmt.name
  revision            = var.api_revision
  display_name        = var.api_display_name
  path                = var.api_path
  protocols           = var.api_protocols

  import {
    content_format = var.content_format
    content_value  = var.content_value
  }

  tags = var.tags
}
