variable "ase_name" {
  type        = string
  description = "App Service name"
}
variable "ase_mysql" {
  type        = bool
  description = "MySQL In App"
}
variable "rg_location" {
  type        = string
  description = "Resource Group location"
}
variable "rg_name" {
  type        = string
  description = "Resource Group name"
}
variable "asp_id" {
  type        = string
  description = "App Service Plan id"
}