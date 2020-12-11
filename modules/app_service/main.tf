terraform {
  required_version = ">= 0.13"
}

resource "azurerm_app_service" "ase" {
  name                = var.ase_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = var.asp_id

}