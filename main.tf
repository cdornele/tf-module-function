
resource "random_integer" "ri" {
    min=10
    max=99
}

resource "azurerm_app_service_plan" "func-plan" {
  name                = "${var.prefix}-${trimsuffix(var.service, "tion")}-service-plan"
  location            = var.build_location
  resource_group_name = var.resource_group
  kind                = "FunctionApp"
  reserved            = true
  tags                       = var.tags

  sku {
    tier = var.service_plan_tier
    size = var.service_plan_size
  }
}

resource "azurerm_function_app" "func-app" {
  name                       = "${var.prefix}-${trimsuffix(var.service, "tion")}-${random_integer.ri.result}"
  location                   = var.build_location
  resource_group_name        = var.resource_group
  app_service_plan_id        = azurerm_app_service_plan.func-plan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  os_type                    = "linux"
  version                    = "~3"
  tags                       = var.tags

  site_config {
    linux_fx_version= "Python|3.8"
    use_32_bit_worker_process= false
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "COSMOSDB_CONNECTION_STRING" = var.cosmosdb_connection_string
  }
}