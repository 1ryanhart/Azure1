variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-project"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "username" {
  description = "username"
  default = "azureuser" 
}


variable "password" {
  description = "username"
  default = "Password1234" 
}

variable "vm_count" {
  description = "number of virtual machines to be deployed"
  default = "2" 
}