variable "vpn_server_configuration_policy_groups" {
  description = <<EOT
Map of vpn_server_configuration_policy_groups, attributes below
Required:
    - name
    - vpn_server_configuration_id
    - policy (block):
        - name (required)
        - type (required)
        - value (required)
Optional:
    - is_default
    - priority
EOT

  type = map(object({
    name                        = string
    vpn_server_configuration_id = string
    is_default                  = optional(bool)
    priority                    = optional(number)
    policy = list(object({
      name  = string
      type  = string
      value = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configuration_policy_groups : (
        length(v.policy) >= 1
      )
    ])
    error_message = "Each policy list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_server_configuration_policy_group's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: vpn_server_configuration_id
  #   source:    [from virtualwans.ValidateVpnServerConfigurationID] !ok
  # path: vpn_server_configuration_id
  #   source:    [from virtualwans.ValidateVpnServerConfigurationID] err != nil
  # path: policy.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: policy.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: policy.value
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: priority
  #   condition: value >= 0
  #   message:   must be at least 0
}

