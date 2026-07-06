output "vpn_server_configuration_policy_groups" {
  description = "All vpn_server_configuration_policy_group resources"
  value       = azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups
}
output "vpn_server_configuration_policy_groups_is_default" {
  description = "List of is_default values across all vpn_server_configuration_policy_groups"
  value       = [for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : v.is_default]
}
output "vpn_server_configuration_policy_groups_name" {
  description = "List of name values across all vpn_server_configuration_policy_groups"
  value       = [for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : v.name]
}
output "vpn_server_configuration_policy_groups_policy" {
  description = "List of policy values across all vpn_server_configuration_policy_groups"
  value       = [for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : v.policy]
}
output "vpn_server_configuration_policy_groups_priority" {
  description = "List of priority values across all vpn_server_configuration_policy_groups"
  value       = [for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : v.priority]
}
output "vpn_server_configuration_policy_groups_vpn_server_configuration_id" {
  description = "List of vpn_server_configuration_id values across all vpn_server_configuration_policy_groups"
  value       = [for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : v.vpn_server_configuration_id]
}

