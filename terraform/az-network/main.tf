provider "azurerm" {
  version = "=2.5.0"
  features {}
}

# create virtual network
resource "azurerm_virtual_network" "network" {
  name                = "${var.resource-group.name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource-group.location
  resource_group_name = var.resource-group.name
}

# create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.resource-group.name}-subnet"
  resource_group_name  = var.resource-group.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefix       = "10.0.1.0/24"
}
