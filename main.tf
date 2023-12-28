provider "azurerm" {
  features {}

  client_id       = "cb0119f9-e76a-482d-bd0b-df815856bef3"
  client_secret   = "tw08Q~6TKrLc93r~SLIIMxAPjnJKTGIjwguQhdvC"
  tenant_id       = "c4d10af2-b721-4268-981e-87e9fd52cc5b"
  subscription_id = "341a1c60-cd37-4bab-8e4c-9c0e5116371f"
}

resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group-name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network-name
  location            = var.location
  resource_group_name = var.azurerm_resource_group-name
  address_space       = var.address_space
  depends_on = [ var.azurerm_resource_group-name ]
}

resource "azurerm_subnet" "subnet001" {
  name                 = var.azurerm_subnet001
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes001
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "subnet002" {
  name                 = var.azurerm_subnet002
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes002
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "subnet003" {
  name                 = var.azurerm_subnet003
  resource_group_name  = var.azurerm_resource_group-name
  virtual_network_name = var.azurerm_virtual_network-name
  address_prefixes     = var.address_prefixes003
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.azurerm_network_security_group-name
  location            = var.location
  resource_group_name = var.azurerm_resource_group-name

  security_rule {
    name                       = var.name
    priority                   = var.priority
    direction                  = var.direction
    access                     = var.access
    protocol                   = var.protocol
    source_port_range          = var.source_port_range
    destination_port_range     = var.destination_port_range
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }
}