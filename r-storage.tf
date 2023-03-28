resource "azurerm_storage_account" "main" {
  name = local.name

  location                  = local.location
  resource_group_name       = data.azurerm_resource_group.main.name
  tags                      = local.tags
  account_kind              = var.kind
  account_tier              = local.account_tier
  account_replication_type  = local.account_replication_type
  access_tier               = var.access_tier
  is_hns_enabled            = var.is_hns_enabled
  enable_https_traffic_only = var.https_only
  min_tls_version           = var.min_tls_version
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public

  network_rules {
    bypass                     = var.network_bypass
    default_action             = var.public_network_enabled ? "Allow" : "Deny"
    ip_rules                   = var.ip_whitelist
    virtual_network_subnet_ids = var.subnet_whitelist
  }

  dynamic "identity" {
    for_each = var.identity_enabled ? [1] : []

    content {
      type = var.identity_type
    }
  }

  lifecycle {
    prevent_destroy = true
  }

}

resource "azurerm_storage_container" "main" {
  for_each = toset(var.container_name)

  name                  = each.value
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = var.container_access_type
}

