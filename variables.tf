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
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configuration_policy_groups : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configuration_policy_groups : (
        alltrue([for item in v.policy : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configuration_policy_groups : (
        alltrue([for item in v.policy : (length(item.value) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_server_configuration_policy_groups : (
        v.priority == null || (v.priority >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

