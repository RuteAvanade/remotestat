terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
  cloud {
    organization = "RuteAvanade"
    workspaces {
      name = "remotestat"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg1" {
  name     = "813-621e4831-hands-on-with-terraform-on-azure"
  location = "South Central US"
}


module "securestorage" {
  source               = "app.terraform.io/RuteAvanade/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg1.location
  resource_group_name  = azurerm_resource_group.rg1.name
  storage_account_name = "abcedrfjytheaabc"
  environment = "Production"
}