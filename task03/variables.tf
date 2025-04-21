variable "storage_account_name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "creator_tag" {
  description = "Tag to apply to resources"
  type        = string
}

variable "resource_group_name" {
  description = "resource group namke"
  type        = string
}
variable "backend_subnet_name" {
  description = "backend subnet namne"
  type        = string
}
variable "frontend_subnet_name" {
  description = "front subnet name"
  type        = string
}
