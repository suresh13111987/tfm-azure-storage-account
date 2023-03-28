locals {
  name = coalesce(
    var.custom_name,
    var.is_hns_enabled ?
    "${var.pep_defaults.app_prefix}${var.pep_defaults.environment}adls2" :
    "${var.pep_defaults.app_prefix}${var.pep_defaults.environment}blob"
  )

  resource_group_name = coalesce(
    var.custom_resource_group,
    var.pep_defaults.resource_groups.default
  )

  location = coalesce(
    var.custom_location,
    data.azurerm_resource_group.main.location
  )

  tags = merge(
    var.pep_defaults.tags,
    var.extra_tags
  )

  account_tier             = (var.kind == "FileStorage" ? "Premium" : split("_", var.sku)[0])
  account_replication_type = (local.account_tier == "Premium" ? "LRS" : split("_", var.sku)[1])

  cmk_name = coalesce(
    var.custom_cmk_name,
    "${local.name}-cmk-${random_string.unique.result}"
  )

}