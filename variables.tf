variable "resource_group_name" {
  description = "The name of the resource group in which to create the API Management instance."
  type        = string
}

variable "location" {
  description = "The Azure region where the API Management instance should be created."
  type        = string
  default     = "West Europe"
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
  default     = "Developer_1"
}

variable "api_name" {
  description = "The name of the API."
  type        = string
}

variable "api_revision" {
  description = "The revision of the API."
  type        = string
  default     = "1"
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
  default     = ["https"]
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
  default     = {}
}
