resource_group_name    = "your-resource-group-name"
location               = "East US"
api_management_name    = "your-apim-name"
publisher_name         = "Your Publisher"
publisher_email        = "publisher@example.com"
sku_name               = "Developer"
api_name               = "your-api-name"
api_revision           = "1"
api_display_name       = "Your API Display Name"
api_path               = "api-path"
api_protocols          = ["https"]
content_format         = "swagger-link"
content_value          = "https://example.com/api-definition.json"
tags                   = {
  "Environment" = "Development"
}
sentinel_workspace_id  = "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.OperationalInsights/workspaces/your-log-analytics-workspace"
