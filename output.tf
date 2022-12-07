output "application_public_address" {
  value = azurerm_public_ip.team2.fqdn
}
# output "application_public_address" {
#   value = azurerm_mysql_database.wordpress.server_name
# }
# output "wordpress_host"{
#   value=azurerm_mysql_server.wordpress.fqdn
# }