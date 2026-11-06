terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Local state for now. Moves to a remote backend with locking in project 2.
}

provider "azurerm" {
  features {}

  # azurerm 4.x requires the subscription ID up front. It comes from a
  # variable so the real ID stays out of the public repo.
  subscription_id = var.subscription_id

  # The identity running this has no rights to register resource providers,
  # and everything needed here is already registered.
  resource_provider_registrations = "none"
}
