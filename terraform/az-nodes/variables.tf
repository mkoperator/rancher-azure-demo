variable "prefix" {
  description = "Prefix to differentiate these nodes."
}

variable "resource-group" {
  description = "Resource Group where the nodes reside."

}

variable "node-count" {
  description = "Number of the nodes."
}

variable "commandToExecute" {
  description = "Command added to the custom data to execute at setup time"
  type = string
  default = "sleep 0"
}

variable "subnet-id" {
  description = "Subnet where the nics are created."
}
variable "node-definition" {
    description = "coming from main script"
}

variable "node-defaults" {
  description = "ssh, size, os information for the nodes."
  type = object({
    admin-username = string
    ssh-keypath = string
    ssh-keypath_private = string
    size = string
    disk-type = string
    publisher = string
    offer     = string
    sku       = string
    version   = string
    docker-version = string
  })

  default = {
    admin-username = "admin"
    ssh-keypath = "~/.ssh/id_rsa.pub"
    ssh-keypath_private = "~/.ssh/id_rsa"
    size = "Standard_D2s_v3"
    disk-type = "Premium_LRS"
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
    docker-version = "19.03"
  }
}
locals {
  node-definition = merge(var.node-defaults, var.node-definition)
}