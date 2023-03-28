resource "azurerm_key_vault_secret" "connkey" {
  count = var.upload_secrets ? 1 : 0

  key_vault_id = var.key_vault_id
  name         = "${azurerm_storage_account.main.name}-connkey"
  value        = azurerm_storage_account.main.secondary_access_key
}

resource "azurerm_key_vault_secret" "connstring" {
  count = var.upload_secrets ? 1 : 0

  key_vault_id = var.key_vault_id
  name         = "${azurerm_storage_account.main.name}-connstring"
  value        = azurerm_storage_account.main.secondary_connection_string
}

# Create CMK encrption key if cmk_encryption flag is true 
resource "azurerm_key_vault_key" "cmk" {
  count = var.cmk_encryption ? 1 : 0

  name         = local.cmk_name
  key_vault_id = var.key_vault_id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]
}

resource "azurerm_key_vault_access_policy" "cmk" {
  count = var.cmk_encryption ? 1 : 0

  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current_config.tenant_id
  object_id    = azurerm_storage_account.main.identity[0].principal_id

  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey"
  ]
  secret_permissions = [
    "Get"
  ]
}

# Associate Storage Account with CMK encryption key created
resource "azurerm_storage_account_customer_managed_key" "cmk" {
  count = var.cmk_encryption ? 1 : 0

  storage_account_id = azurerm_storage_account.main.id
  key_vault_id       = var.key_vault_id
  key_name           = azurerm_key_vault_key.cmk[0].name

  depends_on = [
    azurerm_key_vault_access_policy.cmk
  ]
}


