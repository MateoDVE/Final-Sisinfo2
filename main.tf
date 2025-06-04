terraform{
  required_providers{
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
}

provider "azurerm"{
  features {}
  subscription_id = "a6f4616e-25d9-4720-a9ce-8a455e52586e"
  tenant_id       = "cc28633f-12b8-46cb-bc15-951dae239b4d"
  client_id       = "7cfdc6fe-6556-4a1c-a01b-e670295de601"
  client_secret   = "tmx8Q~LJhBzK0KstRyHdFkkPbuLt1IiZ5ez2Cb.9"
}

resource "azurerm_resource_group" "gr"{
  name     = "GR-Sisinfo2-PF"
  location = "Brazil South"
}

resource "azurerm_storage_account" "sa"{
  name                     = "saproyectofinal12682879"
  resource_group_name      = azurerm_resource_group.gr.name
  location                 = azurerm_resource_group.gr.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "raw" {
  name                  = "raw"
  storage_account_id    = azurerm_storage_account.sa.id
}

resource "azurerm_storage_blob" "clientes" {
  name                   = "Clientes.csv"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = ".csv/Clientes.csv"
}

resource "azurerm_storage_blob" "Clientes_BD-GEN" {
  name                   = "Clientes_BD-GEN.csv"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = ".csv/Clientes_BD-GEN.csv"
}

resource "azurerm_storage_blob" "Clientes_location" {
  name                   = "Clientes_location.csv"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = ".csv/Clientes_location.csv"
}

resource "azurerm_storage_blob" "Detalle_ventas" {
  name                   = "Detalle_ventas.csv"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.raw.name
  type                   = "Block"
  source                 = ".csv/Detalle_ventas.csv"
}

resource "azurerm_storage_blob" "Productos_CAT_MANT" {
    name                   = "Productos_CAT_MANT.csv"
    storage_account_name   = azurerm_storage_account.sa.name
    storage_container_name = azurerm_storage_container.raw.name
    type                   = "Block"
    source                 = ".csv/Productos_CAT_MANT.csv"
}

resource "azurerm_storage_blob" "Productos" {
    name                   = "Productos.csv"
    storage_account_name   = azurerm_storage_account.sa.name
    storage_container_name = azurerm_storage_container.raw.name
    type                   = "Block"
    source                 = ".csv/Productos.csv"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sql-ucb-sisinfo12682879"
  resource_group_name          = azurerm_resource_group.gr.name
  location                     = azurerm_resource_group.gr.location
  version                     = "12.0"
  administrator_login         = "mateo"
  administrator_login_password = "ToMaTes2207@"
}

resource "azurerm_mssql_firewall_rule" "rulefirewall" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_mssql_database" "dw_proyecto-final" {
  name         = "dw_proyecto-final"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "Basic"
  enclave_type = "VBS"
 
  tags = {
    foo = "bar"
  }
 
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_data_factory" "adf" {
  name                = "adf-sisinfo-proyecto-final12682879"
  location            = azurerm_resource_group.gr.location
  resource_group_name = azurerm_resource_group.gr.name


}