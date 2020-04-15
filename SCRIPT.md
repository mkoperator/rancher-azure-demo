# Demo Script
* RUN: First script to setup rke.

As the easy button for kubernetes, we want to enable out clients to provision not just rancher quickly but also workload clusters.  

Uzing Terraform, the infrastructure as code tool. We are going to run my code to provision and RKE cluster in Azure, with Rancher on top. Then we'll run another script to setup our azure credentials inside rancher, create a node template, and deploy an RKE cluster.

Due to the time restrictions of this demo, I went ahead and ran the RKE creation script and here are the nodes in Azure.

* SHOW: Azure Admin nodes. 

We can see the terraform output here from my earlier run.

* SHOW: CMD output of RKE script.

Now lets setup rancher on top.

* CMD: Run rancher install on RKE cluster.

While this is running I can tell you a little about what it is doing. Its connecting to the RKE cluster using the kubeconfig created as part of the RKE setup and provisioning. Then installing rancher on it and setting up my special configuration with Github Auth. In the next script, we'll add credentials to deploy RKE clusters on Azure either via the CLI or the UI.

* SHOW: Commandline output of Rancher Setup

We will need to take these credentials and set them as ENVs for the next scripts.

* CMD: Set credentials as ENVs

Lets go to the rancher admin, where it is already plugged with my github account. We'll give it permisisons and login.

Now to enable rancher to setup hosted RKE clusters we need to add our Azure or other provider credentials. Here you can see we do not currently have any installed credentials, node templates, or clusters.

* SHOW: Rancher UI, no credentials, no node templates, no clusters.

Now lets insert our credentials! I already copied my azure cli creds into terraform with full permissions to create infrastructure on my azure account.

* CMD: Insert credentials into Rancher

This is inserting the credentials into rancher and a node template for our child rke cluster.

* SHOW: Rancher UI, credentials, node templates.

Here you can now see the credentials and node template. Now lets finally have it add a child rke cluster while I take your questions and we watch the code.

* CMD: Deploy RKE cluster

Before we go to the Q&A, couple short cut notes. I had pre-provisioned the static ip to handle the domain to which rancher is deploying, this could be made dynamic with more effort.

Also, there are many improvement areas such as enabling ssl, security, and monitoring features in rancher and the child clusters. 

Questions?

* SHOW: Rancher UI, RKE child cluster.

Fin
