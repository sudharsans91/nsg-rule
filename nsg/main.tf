locals {
  nsgs = csvdecode(file("./NSG-List-CSV/NSG-List.csv"))
}

data "azurerm_network_security_group" "imported_nsgs" {
  for_each = { for nsg in local.nsgs : nsg.nsg_name => nsg }

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_group" "modified_nsgs" {
  for_each = data.azurerm_network_security_group.imported_nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "AllowIn-App-Test-rule1-TCP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1434,1433,443,8080,445"
    source_address_prefix      = "10.5.2.1,10.6.7.9,10.11.12.1"
    destination_address_prefix = "10.82.12.0/29"
  }

}