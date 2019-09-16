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
kubectl create clusterrolebinding cluster-adm \
--clusterrole=cluster-admin \
--user=system:serviceaccount:jx:jenkins-x-gc-activities


Navigate to your Jenkins X URL
* Run the command *jx console* and paste the Jenkins url to you browser

Kubernetes Authorization in the Jenkins management web interface:
Navigate to your Jenkins X URL and click "Manage Jenkins" and then "Configure System". Scroll down to the "Kubernetes" section. In the Kubernetes URL section you will need to post the server URL from your config file. Next add your Kubernetes server certificate key in the section below. To get your key, copy the contents of your certificate-authority-data from your Kubeconfig file on the jump-box host

cat .kube/config

Convert the certificate into base64 format
pbpaste | base64 -D

Container Registry Authorization in the Jenkins management web interface:
In order to connect the Oracle Container Registry to our Jenkins X deployment we will need to change your "global properties" and generate an auth token in OCI. To change your "global properties" in Jenkins X, navigate to the 'global properties' section of the configuration panel. In the value section add <region-code>.ocir.io where <region-code> corresponds to the code for the OCIR region you are using, as follows:
 * enter fra as the region code for Frankfurt
 * enter iad as the region code for Ashburn
 * enter lhr as the region code for London
 * enter phx as the region code for Phoenix
 
To generate an auth token, in the Oracle Cloud Infrastructure (OCI) console navigate to "Identity" and then "Users". Click your user name, and then click the "Auth Tokens" tab. Click "Generate Token" and provide a name for your token. Be sure to copy your token to a notepad because you will not be able to access this token again.

Enable Jenkins X to authenticate to OCIR, to push and pull images from the repository when build commands are run. Add your variables to the command below:

jx create docker auth --host <region-code.ocir.io> -u '<tenancy-name>/<oci-username>' -s "<auth-token>" -email '<email address for notifications>'
 
<b>5. Run Jenkins-X Quickstart</b>

Run the following command on your jump-box host:

jx create quickstart
