# Create a SQL Server
resource "azurerm_sql_server" "ss" {
  name                         = var.ss_name
  resource_group_name          = var.rg_name
  location                     = var.ss_location
  version                      = "12.0"
  administrator_login          = var.ss_administration_login
  administrator_login_password = var.ss_administrator_login_password
}

# Create a My SQL DB
resource "azurerm_mssql_database" "db" {
  name           = var.db_name
  server_id      = azurerm_sql_server.ss.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true
}