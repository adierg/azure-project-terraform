resource "azurerm_virtual_network" "team2" {
  name                = "team2-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.team2.name
  tags                = var.tags
}

resource "azurerm_subnet" "team2" {
  name                 = "team2-subnet"
  resource_group_name  = azurerm_resource_group.team2.name
  virtual_network_name = azurerm_virtual_network.team2.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "team2" {
  name                = "team2-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.team2.name
  allocation_method   = "Static"
  domain_name_label   = random_string.fqdn.result
  tags                = var.tags
}