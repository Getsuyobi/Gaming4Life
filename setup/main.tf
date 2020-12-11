#Configure Azure Provider
provider "azurerm" {
  version = "~>2.38"
  features {}
}

#Create a new resource group
module "custom_resource_group" {
    source = "../modules/resource_group"
    rg_name = var.rg_name
}

module "custom_app_service_plan" {
  source       = "../modules/app_service_plan"
  asp_name     = var.asp_name
  asp_kind     = var.asp_kind
  asp_tier     = var.asp_tier
  asp_size     = var.asp_size
  rg_name      = var.rg_name
}

module "custom_app_service" {
  source      = "../modules/app_service"
  ase_name    = var.ase_name
  ase_mysql   = var.ase_mysql
  rg_location = var.rg_location 
  rg_name     = var.rg_name
  asp_id      = module.custom_app_service_plan.details.id
}

module "custom_traffic_manager_profile" {
  source   = "../modules/traffic_manager_profile"
  tmp_name = var.tmp_name
  tmp_rtn  = var.tmp_rtn
  dns_rlt  = var.dns_rlt
  dns_ttl  = var.dns_ttl
  mnt_ptc  = var.mnt_ptc
  mnt_prt  = var.mnt_prt
  mnt_pth  = var.mnt_pth
  mnt_int  = var.mnt_int
  mnt_tis  = var.mnt_tis
  mnt_tnof = var.mnt_tnof
  rg_name  = module.custom_resource_group.details.name
}

module "custom_traffic_manager_endpoint" {
  source     = "../modules/traffic_manager_endpoint"
  tme_name   = var.tme_name
  tme_estat  = var.tme_estat
  tme_type   = var.tme_type
  tme_rid    = module.custom_app_service.details.id
  tme_weight = var.tme_weight
  tme_prio   = var.tme_prio
  tmp_name   = module.custom_traffic_manager_profile.details.name
  rg_name    = module.custom_resource_group.details.name
}

module "custom_content_delivery_network" {
  source = "../modules/AzureCDN"
  sa_name = var.sa_name
  sa_location = var.sa_location
  rg_name = var.rg_name
  cdnpro_name = var.cdnpro_name
  cdnpro_location = var.cdnpro_location
  cdnend_name = var.cdnend_name
  cdnend_location = var.cdnend_location
}

module "custom_database_mysql" {
  source = "../modules/AzureDBMySQL"
  ss_name = var.ss_name
  rg_name = var.rg_name
  ss_administration_login = var.ss_administration_login
  ss_administrator_login_password = var.ss_administrator_login_password
  db_name = var.db_name
  ss_id = var.ss_id
}

