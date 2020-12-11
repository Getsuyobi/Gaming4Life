terraform {
  required_version = ">= 0.13"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  location                 = var.sa_location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_cdn_profile" "cdnpro" {
  name                = var.cdnpro_name
  location            = var.cdnpro_location
  resource_group_name = var.rg_name
  sku                 = "Standard_Akamai"
}

resource "azurerm_cdn_endpoint" "cdnend" {
  name                = var.cdnend_name
  profile_name        = var.cdnpro_name
  location            = var.cdnend_location
  resource_group_name = var.rg_name

    origin {
    name      = "Game4Life"
    host_name = "www.contoso.com"
  }

}