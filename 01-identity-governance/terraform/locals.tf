locals {
  # Scopes, built once from the subscription ID so the long paths are never
  # typed twice.
  sub_scope = "/subscriptions/${var.subscription_id}"
  rg_scope  = "${local.sub_scope}/resourceGroups/rg-azsprint-network"

  # Built-in role definition IDs. The GUIDs are the same in every tenant;
  # PIM wants them in subscription-qualified form.
  role_defs            = "${local.sub_scope}/providers/Microsoft.Authorization/roleDefinitions"
  contributor_id       = "${local.role_defs}/b24988ac-6180-42a0-ab88-20f7382dd24c"
  user_access_admin_id = "${local.role_defs}/18d7d88d-d35e-4fb5-a5c3-7773c20a72d9"
}
