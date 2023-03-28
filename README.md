# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 
This Module will create Blob Storage Account or Storage Azure Data Lake Services, and Storage Containers 

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.48 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.48 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_secret.connkey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.connstring](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_storage_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_customer_managed_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key) | resource |
| [azurerm_storage_container.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_client_config.current_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | The access tier of the storage account. | `string` | `"Hot"` | no |
| <a name="input_cmk_encryption"></a> [cmk\_encryption](#input\_cmk\_encryption) | Customer Managed Key enabled for storage account | `bool` | `false` | no |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | Access type of Containers on this Storage: Private, Public | `string` | `"private"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Containers on this Storage | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Azure location for storage account. | `string` | `""` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Name of the storage account, generated if not set. | `string` | `""` | no |
| <a name="input_custom_resource_group"></a> [custom\_resource\_group](#input\_custom\_resource\_group) | Resource Group the resources will belong to | `string` | `""` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add | `map(string)` | `{}` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Set to `true` to only allow HTTPS traffic, or `false` to disable it. | `bool` | `true` | no |
| <a name="input_identity_enabled"></a> [identity\_enabled](#input\_identity\_enabled) | Enable setting up identity type for this Storage Account. Mandatory to set true if cmk\_encryption (Customer Managed Key) is true. | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the identity type of the Storage Account. | `string` | `"SystemAssigned"` | no |
| <a name="input_ip_whitelist"></a> [ip\_whitelist](#input\_ip\_whitelist) | List of IP's to allow through firewall | `list(string)` | `[]` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | Is Hierarchical Namespace enabled? | `bool` | `false` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | ID of key vault to upload account connection secrets | `string` | `""` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | The kind of storage account. | `string` | `"StorageV2"` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | he minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. | `string` | `"TLS1_2"` | no |
| <a name="input_network_bypass"></a> [network\_bypass](#input\_network\_bypass) | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None | `list(string)` | <pre>[<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_pep_defaults"></a> [pep\_defaults](#input\_pep\_defaults) | n/a | `any` | n/a | yes |
| <a name="input_public_network_enabled"></a> [public\_network\_enabled](#input\_public\_network\_enabled) | Allow public access? | `bool` | `false` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the storage account. | `string` | `"Standard_LRS"` | no |
| <a name="input_subnet_whitelist"></a> [subnet\_whitelist](#input\_subnet\_whitelist) | List of subnet IDs to allow through firewall | `list(string)` | `[]` | no |
| <a name="input_upload_secrets"></a> [upload\_secrets](#input\_upload\_secrets) | Whether to upload account connection secrets to key vault | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the storage account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the storage account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | The primary connection string for the storage account. |
<!-- END_TF_DOCS -->

## Example
```
# Module Example for ADLS 

data "azurerm_subnet" "main" {
    name  = "pep-ase-01-subnet"
    virtual_network_name    = "pep-paas-nonprod-02-eus-vnet"
    resource_group_name     = "pep-network-nonprod-datahub-eus-01-rg"
}

module "storage_account_adls" { 
    source            = "git::https://dev.azure.com/PepsiCoIT/PepsiCo_Automation_Framework/_git/tfm-azure-storage-account" 
    custom_name       = "cdodevfdnadls"
    custom_resource_group    = "pep-cdo-shared-sql-fdn-eus-01-rg" 
    kind              = "StorageV2"  
    sku               = "Standard_LRS"
    access_tier       = "Hot"
    is_hns_enabled    = true
    key_vault_id      = module.keyvault.id
    network_bypass    = ["AzureServices"]
    ip_whitelist      = ["68.196.243.24"]
    subnet_whitelist = [
      data.azurerm_subnet.main.id,
      <subnet ID>
    ]
    container_name    = ["cont1", "cont2"]
    cmk_encryption     = true
    identity_enabled  = true
    upload_secrets    = true
}

#Module Example for Blob Storage Account 
module "storage_account_blob" { 
    source            = "git::https://dev.azure.com/PepsiCoIT/PepsiCo_Automation_Framework/_git/tfm-azure-storage-account" 
    custom_name       = "cdodevfdnblob"
    custom_resource_group    = "pep-cdo-huron-fdn-eus-01-rg"

    kind              = "StorageV2"  
    sku               = "Standard_LRS"
    access_tier       = "Hot"

    key_vault_id      = module.keyvault.id
    network_bypass    = ["AzureServices"]
    ip_whitelist      = ["68.196.243.24"]
    subnet_whitelist = [
      data.azurerm_subnet.main.id,
      <subnet ID>
    ]
    container_name    = ["blobcont1", "blobcont2"]
    cmk_encryption     = true
    identity_enabled  = true
    upload_secrets    = true
}
```