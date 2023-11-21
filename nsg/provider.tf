terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "2.73.0"
      version = "3.53.0"
    }
  }

  backend "local" {
    path = "./NSG-List-CSV/rulemodify.tfstate"
  }
}


data "azurerm_subscription" "primary" {
}

provider "azurerm" {
  features {}
}

