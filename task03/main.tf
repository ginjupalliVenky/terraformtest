data "azurerm_resource_group" "existing" {
  name = "cmtr-9b654ca3-mod3-rg"
}

resource "azurerm_resource_group" "this" {
  name     = data.azurerm_resource_group.existing.name
  location = data.azurerm_resource_group.existing.location
  tags = {
    Creator = var.creator_tag
  }
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Creator = var.creator_tag
  }
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags = {
    Creator = var.creator_tag
  }
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}