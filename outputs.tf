output "id" {
  description = "Nat Gateway ID."
  value       = azurerm_nat_gateway.main.id
}

output "name" {
  description = "Nat Gateway name."
  value       = azurerm_nat_gateway.main.name
}

output "public_ips_adresses" {
  description = "Public IPs addresses associated to Nat Gateway."
  value       = azurerm_public_ip.main[*].ip_address
}

output "public_ip_ids" {
  description = "IDs of public IPs."
  value       = azurerm_public_ip.main[*].id
}

output "resource" {
  description = "Nat Gateway resource object."
  value       = azurerm_nat_gateway.main
}

output "resource_public_ips" {
  description = "Public IPs resources list object."
  value       = azurerm_public_ip.main
}
