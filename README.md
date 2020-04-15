# Demo Azure Rancher
Demonstrate ability to deploy RKE and Rancher utilizing Terraform on Azure stack.

## Proficiency to Demonstrate
Terraform
    - install rancher on top of RKE clusters
    - spin up and maintain RKE cluster on Azure.
Rancher 
    - Setup & api
RKE
    - Cluster setup via Terraform
    - Rancher install via Terraform
    - Add to rancher from terraform
Azure
    - Knowledge of azure CLI 

## Steps
### Terraform Azure Setup for Rancher
. Resource Group
. Setup New Network & Subnet
. Use cloud init to setup docker
. Setup Nodes
. Setup Load Balancer
. Install RKE
. Setup Helm
. Install Cert Manager
. Install Rancher
. Bootstrap Rancher

### Terraform Azure Setup for Rancher Configs
. Insert azure cloud credentials
. Insert node template

### Terraform deploy RKE Cluster
. Insert cluster based on template.

# rancher-azure-demo
