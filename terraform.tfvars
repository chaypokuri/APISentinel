resource_group_name  = "my-api-rg"
location             = "West Europe"
api_management_name  = "my-api-mgmt"
publisher_name       = "My Company"
publisher_email      = "admin@mycompany.com"
sku_name             = "Developer_1"
api_name             = "my-api"
api_revision         = "1"
api_display_name     = "My API"
api_path             = "myapi"
api_protocols        = ["https"]
content_format       = "swagger-link-json"
content_value        = "https://example.com/swagger.json"
tags = {
  environment = "dev"
  team        = "api-team"
}
