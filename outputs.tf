output "vpn_server_configuration_policy_groups_id" {
  description = "Map of id values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.id }
}
output "vpn_server_configuration_policy_groups_is_default" {
  description = "Map of is_default values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.is_default }
}
output "vpn_server_configuration_policy_groups_name" {
  description = "Map of name values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.name }
}
output "vpn_server_configuration_policy_groups_policy" {
  description = "Map of policy values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.policy }
}
output "vpn_server_configuration_policy_groups_priority" {
  description = "Map of priority values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.priority }
}
output "vpn_server_configuration_policy_groups_vpn_server_configuration_id" {
  description = "Map of vpn_server_configuration_id values across all vpn_server_configuration_policy_groups, keyed the same as var.vpn_server_configuration_policy_groups"
  value       = { for k, v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_groups : k => v.vpn_server_configuration_id }
}

