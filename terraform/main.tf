provider "azurerm" {
    version = "=2.5.0"
    features {}
}

data azurerm_subscription "current" {}

# AZ Resource Group
module "resource-group" {
  source = "./az-resource-group"
  name = var.azure-resource-group
  region = var.azure-region
  prefix = "r2"
}

# AZ Network
module "network" {
  source = "./az-network"
  resource-group = module.resource-group.resource-group
}

# AZ Service Principal
# Random pass 
resource "random_password" "service-principal-password" {
  length = 16
}

module "serviceprincipal" {
  source = "./az-service-principal"
  resource-group-id = module.resource-group.resource-group.id
  application-name = "demo-azure-principal"
  password = random_password.service-principal-password.result
}

# Node definition
locals {
   node-definition = {
    admin-username = var.node-credentials.admin-username
    ssh-keypath = var.node-credentials.ssh-keypath
    ssh-keypath-private = var.node-credentials.ssh-keypath-private
  }
}

# setup nodes
module "rancher-nodes" {
  source = "./az-nodes"
  resource-group = module.resource-group.resource-group
  prefix = "r2"
  node-count = var.rancher-num-nodes
  subnet-id = module.network.subnet-id
  node-definition = local.node-definition  
}

# setup load balancer
module "rancher-lb" {
  source = "./az-loadbalancer"

  prefix = "r2"
  resource-group = module.resource-group.resource-group
  domain-name-label = var.rancher-domain-name
  backend-nics = module.rancher-nodes.privateIps
}

# setup rke cluster
resource rke_cluster "rancher-cluster" {
  depends_on = [module.rancher-nodes]
  dynamic nodes {
    for_each = module.rancher-nodes.nodes
    content {
      address = module.rancher-nodes.publicIps[nodes.key].ip_address
      internal_address = module.rancher-nodes.privateIps[nodes.key].private_ip_address
      user    = module.rancher-nodes.node-definition.admin-username
      role    = ["controlplane", "etcd", "worker"]
      ssh_key = file(module.rancher-nodes.node-definition.ssh-keypath-private)
    }
  }
}

resource "local_file" "kube-cluster-yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content = rke_cluster.rancher-cluster.kube_config_yaml
}
locals {
  domain-name = module.rancher-lb.fqdn
}