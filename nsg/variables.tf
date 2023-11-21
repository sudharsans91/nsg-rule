# General variables
variable "csv_path" {
  type    = string
   # Specify the path to your CSV file
}

variable "resource_group_name" {
  type    = string
  default = "rtl-06-d1-RuleUpdateTest-nsg-rg-001"  # Common resource group name for all NSGs
}

variable "rule_name" {
  type    = string
  default = "CVS-AllowIn-App-Test-rule1-TCP"  # Name of the rule you want to update
}

variable "new_security_rule" {
  type = map(string)
  default = {
    name                       = "CVS-AllowIn-App-Test-rule1-TCP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.1.10.2"
    destination_address_prefix = "10.1.0.0/16"
  }
}

# Terraform State Storage Account variables
variable "backendAzureRmResourceGroupName" {
  description = "backendAzureRmResourceGroupName"
  type        = string
}
variable "backendAzureRmStorageAccountName" {
  description = "backendAzureRmStorageAccountName"
  type        = string
}
variable "backendAzureRmContainerName" {
  description = "backendAzureRmContainerName"
  type        = string
}
variable "backendAzureRmKey" {
  description = "backendAzureRmKey"
  type        = string
}
