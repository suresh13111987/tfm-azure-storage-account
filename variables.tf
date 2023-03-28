variable "pep_defaults" {

}

variable "custom_name" {
  description = "Name of the storage account, generated if not set."
  type        = string
  default     = ""
}

variable "custom_resource_group" {
  description = "Resource Group the resources will belong to"
  type        = string
  default     = ""
}

variable "custom_location" {
  description = "Azure location for storage account."
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "kind" {
  type        = string
  default     = "StorageV2"
  description = "The kind of storage account."
}

variable "sku" {
  type        = string
  default     = "Standard_LRS"
  description = "The SKU of the storage account."
}

variable "access_tier" {
  type        = string
  default     = "Hot"
  description = "The access tier of the storage account."
}

variable "is_hns_enabled" {
  type        = bool
  default     = false
  description = "Is Hierarchical Namespace enabled?"
}

variable "https_only" {
  type        = bool
  default     = true
  description = "Set to `true` to only allow HTTPS traffic, or `false` to disable it."
}

variable "upload_secrets" {
  type        = bool
  default     = true
  description = "Whether to upload account connection secrets to key vault"
}

variable "key_vault_id" {
  type        = string
  default     = ""
  description = "ID of key vault to upload account connection secrets"
}

variable "public_network_enabled" {
  description = "Allow public access?"
  type        = bool
  default     = false
}

variable "ip_whitelist" {
  description = "List of IP's to allow through firewall"
  type        = list(string)
  default     = []
}

variable "subnet_whitelist" {
  description = "List of subnet IDs to allow through firewall"
  type        = list(string)
  default     = []
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2."
  type        = string
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow nested items within this Account to opt into being public."
  type        = string
  default     = "false"
}

variable "network_bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None"
  type        = list(string)
  default     = ["AzureServices"]
}

variable "cmk_encryption" {
  description = "Customer Managed Key enabled for storage account"
  type        = bool
  default     = false
}

variable "custom_cmk_name" {
  description = "Custom name for Customer-Managed Key (useful for importing existing workspaces)"
  type        = string
  default     = ""
}

variable "identity_type" {
  description = "Specifies the identity type of the Storage Account."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_enabled" {
  description = "Enable setting up identity type for this Storage Account. Mandatory to set true if cmk_encryption (Customer Managed Key) is true."
  type        = bool
  default     = false
}

variable "container_name" {
  description = "Containers on this Storage"
  type        = list(string)
  default     = []
}

variable "container_access_type" {
  description = "Access type of Containers on this Storage: Private, Public"
  type        = string
  default     = "private"
}

