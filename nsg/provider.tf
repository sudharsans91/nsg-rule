terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "2.73.0"
      version = "3.53.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.backendAzureRmResourceGroupName
    storage_account_name = var.backendAzureRmStorageAccountName
    container_name       = var.backendAzureRmContainerName
    key                  = var.backendAzureRmKey
  }
}

data "azurerm_subscription" "primary" {
}

provider "azurerm" {
  features {}
}
