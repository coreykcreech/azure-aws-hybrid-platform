# Custom least-privilege role: enough to manage NSG security rules in one
# resource group, nothing else. It is only ever handed out through PIM as an
# eligible assignment (see pim.tf), never as standing access.
resource "azurerm_role_definition" "nsg_rule_operator" {
  name        = "NSG Rule Operator - azsprint"
  description = "Least-privilege role for managing NSG security rules in the azsprint network resource group. Intended for PIM eligible assignment, not standing access."

  # Fixed GUID so the role keeps the same ID it was created with.
  role_definition_id = "c80dd4fc-c178-9cc7-f669-227f29331915"

  # Where the definition lives and where it can be assigned. Scoping both to
  # the one resource group means Azure rejects any attempt to assign it
  # anywhere else.
  scope             = local.rg_scope
  assignable_scopes = [local.rg_scope]

  permissions {
    actions = [
      # Read the NSG, VNet and subnets so the holder can find what they are
      # working on.
      "Microsoft.Network/networkSecurityGroups/read",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/subnets/read",

      # The point of the role: manage rules inside an NSG. No
      # networkSecurityGroups/write, so the NSG itself (tags, settings,
      # deletion) is off limits. Tested 2026-11-06: tagging the NSG was denied.
      "Microsoft.Network/networkSecurityGroups/securityRules/read",
      "Microsoft.Network/networkSecurityGroups/securityRules/write",
      "Microsoft.Network/networkSecurityGroups/securityRules/delete",

      # Lets the portal open the resource group.
      "Microsoft.Resources/subscriptions/resourceGroups/read",
    ]
    data_actions     = []
    not_actions      = []
    not_data_actions = []
  }
}
