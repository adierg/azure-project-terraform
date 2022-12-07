resource "azurerm_lb" "team2" {
  name                = "team2-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.team2.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.team2.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = azurerm_lb.team2.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "team2" {
  resource_group_name = azurerm_resource_group.team2.name
  loadbalancer_id     = azurerm_lb.team2.id
  name                = "ssh-running-probe"
  port                = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
  resource_group_name            = azurerm_resource_group.team2.name
  loadbalancer_id                = azurerm_lb.team2.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.team2.id
}