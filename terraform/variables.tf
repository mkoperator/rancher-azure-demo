variable "azure-region" {
  type = string
  description = "region of azure."
  default = "eastus"
}

variable "azure-resource-group" {
  type = string
  description = "rg for cluster"
  default = "r2mk"
}

variable "rancher-num-nodes" {
  type = number
  description = "number or rancher nodes"
  default = 3
}

# Node Credentials
variable "node-credentials" {
  description = ""
  type = object({admin-username=string,ssh-keypath=string,ssh-keypath-private=string})
  default = { 
    admin-username = "thecrazyrussian"
    ssh-keypath = "~/.ssh/id_rsa.pub"
    ssh-keypath-private = "~/.ssh/id_rsa"
    
  }
}

# Rancher Cluster Domain
variable "rancher-domain-name" {
  type = string
  description = "Domain name for the Rancher cluster"
  default = "mkrancherdemo"
}
