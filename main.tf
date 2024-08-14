provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.59.0"
    }
  }
}

# Variables
variable "resource_group_name" {
  description = "The name of the resource group in which to create the API Management instance."
  type        = string
}

# Other variables here...

# Resource Group
resource "azurerm_resource_group" "api_rg" {
  name     = var.resource_group_name
  location = var.location
}

# API Management Instance
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

# API Definition
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
}

# Diagnostic Setting for API Management
resource "azurerm_monitor_diagnostic_setting" "sentinel_policy_diagnostics" {
  name                       = "apim-policy-diagnostics"
  target_resource_id         = azurerm_api_management.api_mgmt.id
  log_analytics_workspace_id = var.sentinel_workspace_id

  log {
    category = "PolicyInsights"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

# Outputs
output "api_management_id" {
  description = "The ID of the API Management instance."
  value       = azurerm_api_management.api_mgmt.id
}

output "api_id" {
  description = "The ID of the API."
  value       = azurerm_api_management_api.api.id
}
