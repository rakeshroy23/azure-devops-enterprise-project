resource "azurerm_log_analytics_workspace" "main" {

  name                = "ado-dev-law"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "lb" {

  name                       = "lb-diagnostics"
  target_resource_id         = var.load_balancer_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_log {
    category = "LoadBalancerAlertEvent"
  }

  enabled_log {
    category = "LoadBalancerProbeHealthStatus"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
