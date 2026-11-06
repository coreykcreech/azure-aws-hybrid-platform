# Just-in-time access for the day-to-day admin account. Each role has two
# parts:
#   - azurerm_role_management_policy: the PIM role settings (how activation
#     works). Azure creates one per role per scope automatically, so this
#     adopts and edits it rather than creating a new one.
#   - azurerm_pim_eligible_role_assignment: who is eligible. Nothing is
#     active until the admin activates it in PIM.
#
# Every argument on the eligible assignment forces replacement, so any change
# here shows up in a plan as destroy-and-recreate of the eligibility.
# Read the plan before applying.

# ---------------------------------------------------------------------------
# NSG Rule Operator (custom role) on the network resource group
# ---------------------------------------------------------------------------

resource "azurerm_role_management_policy" "nsg_rule_operator" {
  role_definition_id = azurerm_role_definition.nsg_rule_operator.role_definition_resource_id
  scope              = local.rg_scope

  activation_rules {
    maximum_duration                   = "PT1H"
    require_approval                   = false
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = true
  }

  active_assignment_rules {
    expiration_required                = true
    expire_after                       = "P180D"
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = false
  }

  eligible_assignment_rules {
    expiration_required = true
    expire_after        = "P180D"
  }

  notification_rules {
    active_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_activations {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
  }
}

resource "azurerm_pim_eligible_role_assignment" "nsg_rule_operator" {
  principal_id       = var.admin_object_id
  role_definition_id = azurerm_role_definition.nsg_rule_operator.role_definition_resource_id
  scope              = local.rg_scope

  schedule {
    start_date_time = "2026-11-06T19:44:02.2112224+00:00"
    expiration {
      end_date_time = "2027-05-05T19:42:31.368+00:00"
    }
  }
}

# ---------------------------------------------------------------------------
# Contributor on the subscription: everyday resource work
# ---------------------------------------------------------------------------

resource "azurerm_role_management_policy" "contributor" {
  role_definition_id = local.contributor_id
  scope              = local.sub_scope

  activation_rules {
    maximum_duration                   = "PT4H"
    require_approval                   = false
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = true
  }

  active_assignment_rules {
    expiration_required                = true
    expire_after                       = "P180D"
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = false
  }

  eligible_assignment_rules {
    expiration_required = true
    expire_after        = "P180D"
  }

  notification_rules {
    active_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_activations {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
  }
}

resource "azurerm_pim_eligible_role_assignment" "contributor" {
  principal_id       = var.admin_object_id
  role_definition_id = local.contributor_id
  scope              = local.sub_scope

  schedule {
    start_date_time = "2026-11-06T21:27:22.3221803+00:00"
    expiration {
      end_date_time = "2027-05-05T21:26:18.846+00:00"
    }
  }
}

# ---------------------------------------------------------------------------
# User Access Administrator on the subscription: access management only.
# Shorter window because this role can change who has access to everything.
# ---------------------------------------------------------------------------

resource "azurerm_role_management_policy" "user_access_admin" {
  role_definition_id = local.user_access_admin_id
  scope              = local.sub_scope

  activation_rules {
    maximum_duration                   = "PT1H"
    require_approval                   = false
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = true
  }

  active_assignment_rules {
    expiration_required                = true
    expire_after                       = "P180D"
    require_justification              = true
    require_multifactor_authentication = true
    require_ticket_info                = false
  }

  eligible_assignment_rules {
    expiration_required = true
    expire_after        = "P180D"
  }

  notification_rules {
    active_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_activations {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
    eligible_assignments {
      admin_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      approver_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
      assignee_notifications {
        additional_recipients = []
        default_recipients    = true
        notification_level    = "All"
      }
    }
  }
}

resource "azurerm_pim_eligible_role_assignment" "user_access_admin" {
  principal_id       = var.admin_object_id
  role_definition_id = local.user_access_admin_id
  scope              = local.sub_scope

  schedule {
    start_date_time = "2026-11-06T21:31:20.7509237+00:00"
    expiration {
      end_date_time = "2027-05-05T21:27:11.085+00:00"
    }
  }
}
