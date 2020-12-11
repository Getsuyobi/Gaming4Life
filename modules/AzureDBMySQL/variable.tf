variable "ss_name" {
  type = "string"
  description = "SQL Server name"
}

variable "rg_name" {
  type = "string"
  description = "Resource Group name"
}

variable "ss_location" {
  type = "string"
  default     = "West Europe"
  description = "SQL Server name"
}

variable "ss_administration_login" {
  type = "string"
  description = "SQL Server administrator login"
}

variable "ss_administrator_login_password" {
  type = "string"
  description = "SQL Server administrator login password"
}

variable "db_name" {
  type = "string"
  description = "Database name"
}

variable "ss_id" {
  type = "string"
  description = "SQL Server id"
}