# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
**1. Log into MS Azure**
```bash 
az login
```

Make note of the `id` field as this is your subscription_id

Run the following and make not of the `client_secret` and `client_id` fields
```bash
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```
**2. Apply policy to require tags for all resources**
```bash 
az policy definition create --name tagging-policy --rules policy.json --mode indexed --description "require indexed resources to be tagged"
```
 Note: the policy can be verified to exist with the command

```bash 
az policy assignment list
```
**3. Build server image using Packer**

Save your credentials as the following envionment variables
```bash
export ARM_CLIENT_ID=<YOUR CLIENT ID>
export ARM_CLIENT_SECRET=<YOUR CLIENT SECRET>
export ARM_SUBSCRIPTION_ID=<YOUR SUBSCRIPTION ID>
```

Build the image using the command `packer build server.json`

 Note: the image can be verified to exist with the command `az image list`

**3. Create resources including load balancer using Terraform**
1. Run `terraform init` to initialise Terraform
3. Run `terraform plan` to view what will be created
4. Run `terraform apply` to build the web server and load balancer

### Output

Upon a successful Terraform build, the console will display the load balancer public IP: 
```bash
public_ip_address:{Your public ip address}.
```

