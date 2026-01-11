resource "azurerm_vpn_server_configuration_policy_group" "vpn_server_configuration_policy_groups" {
  for_each = var.vpn_server_configuration_policy_groups

  name                        = each.value.name
  vpn_server_configuration_id = each.value.vpn_server_configuration_id
  is_default                  = each.value.is_default
  priority                    = each.value.priority

  policy {
    name  = each.value.policy.name
    type  = each.value.policy.type
    value = each.value.policy.value
  }
}

