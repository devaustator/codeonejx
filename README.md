# codeonejx
Oracle Code One Jenkins-X Hands-On Lab

<b>1. Go to compute</b>

Create oke.compartment for the resources used in this exercise:
 * Identity -> Compartments Create Compartment

Create oke.service user and add it to the administrators group:
 * Identity -> Users -> Create
 * Navigate to the user and Create/Reset password, copy the one time password to clipboard
 * Select Groups at bottom left, and add the user to Administrators Group
 * Log out and log in again with the oke.service user

Create oke.policy to allow the Kubernetes PaaS service to manage the resources:
 * Identity -> Policies -> Create
 * Create a new policy in the (root) compartment of your tenancy
 * Choose option: Keep policy current
 * Policy statement: *allow service OKE to manage all-resources in tenancy*

Create OKE Cluster:
 * Developer Services -> Container Clusters (OKE) -> Create Cluster
 * Uncheck Tiller / Helm enabled and leave other settings as is and click on create cluster
 
Create jump-box VM
 * Compute -> Instances -> Create Instance
 * Name your instance jump-box
 * Select the virtual machine image: Canonical Ubuntu 18.04
 * Paste you SSH key and leave other settings as is

Once the VM has been created note the public IP address and log in via SSH: ssh ubuntu@<vm.public.ip.address>

<b>2. Configure the OCI CLI on the jump-box Virtual Machine</b>

 * Set up CLI https://docs.cloud.oracle.com/iaas/Content/API/Concepts/cliconcepts.htm
 * Documentation on keys and authorisation concepts: https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm
 * Run the command: oci setup config
 
<b>3. Install and configure Kubernetes Tooling and Git Version Control on the jump-box VM</b>

 * Setup kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * Follow the Git setup instructions for Ubuntu: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
 
 Configure kubectl for your Kubernetes cluster:
 * Navigate to Developer Services -> Container Clusters (OKE)
 * Select your cluster and click on Access Kubeconfig on the following screen
 
<b>4. Install and setup Jenkins-X</b>

Follow the instructions for your system at: https://jenkins-x.io/getting-started/install/
 * After the setup finishes note down the addresses and admin password
 * Run the command *jx console* and paste the Jenkins url to you browser

Ensure the jx user has sufficient permissions in the cluster
```kubectl create clusterrolebinding cluster-adm \
--clusterrole=cluster-admin \
--user=system:serviceaccount:jx:jenkins-x-gc-activities```

* Run the command *jx console* and paste the Jenkins url to you browser


