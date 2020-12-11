variable "sa_name" {
  type        = string
  description = "Storage Account name"
}

variable "sa_location" {
  type        = string
  default     = "West Europe"
  description = "Storage Account location"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "cdnpro_name" {
  type        = string
  description = "Content Delivery Network Profile name"
}

variable "cdnpro_location" {
  type        = string
  default     = "West Europe"
  description = "Content Delivery Network Profile location"
}

variable "cdnend_name" {
  type        = string
  description = "Content Delivery Network Endpoint name"
}

variable "cdnend_location" {
  type        = string
  default     = "West Europe"
  description = "Content Delivery Network Endpoint location"
}