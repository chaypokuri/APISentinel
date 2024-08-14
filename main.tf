provider "azurerm" {
  features = {}

}

# Input Variables
variable "resource_group_name" {
  description = "The name of the resource group in which to create the API Management instance."
  type        = string
}

variable "location" {
  description = "The Azure region where the API Management instance should be created."
  type        = string
}

variable "api_management_name" {
  description = "The name of the API Management instance."
  type        = string
}

variable "publisher_name" {
  description = "The name of the publisher."
  type        = string
}

variable "publisher_email" {
  description = "The email of the publisher."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the API Management instance."
  type        = string
}

variable "api_name" {
  description = "The name of the API."
  type        = string
}

variable "api_revision" {
  description = "The revision of the API."
  type        = string
}

variable "api_display_name" {
  description = "The display name of the API."
  type        = string
}

variable "api_path" {
  description = "The path of the API."
  type        = string
}

variable "api_protocols" {
  description = "The protocols supported by the API."
  type        = list(string)
}

variable "content_format" {
  description = "The format of the API definition. (swagger-link-json, swagger-link, wsdl-link, openapi-link)"
  type        = string
}

variable "content_value" {
  description = "The URL of the API definition."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
}

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

  tags = var.tags
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
