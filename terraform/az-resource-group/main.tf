provider "azurerm" {
  version = "=2.5.0"
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name     = var.name
  location = var.region
}
resource "azurerm_availability_set" "availabilitySet" {
  name                = "${var.prefix}-aset"
  location            = var.region
  resource_group_name = var.name

  tags = {
    environment = "Demo"
  }
}