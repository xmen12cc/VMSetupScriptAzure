# Project: Virtual Machine Setup Script for Microsoft Azure Cloud Computing

## Description
This project provides an automated setup script to create and configure a Virtual Machine (VM) in Microsoft Azure Cloud using Azure CLI. The script automates the process of deploying a VM on Azure, making it easier to set up a virtual environment for development, testing, or production.

The script includes creating a resource group, selecting a region, choosing the operating system image, configuring the VM size, networking, and creating the necessary storage accounts. Once set up, the VM will be ready for use with SSH or RDP access, depending on the operating system.

## Purpose
The script simplifies the process of deploying a virtual machine on Azure by automating most of the configuration tasks required for VM creation. This tool is designed to:
- Automate VM creation on Azure.
- Quickly deploy and configure a VM for various use cases (development, testing, etc.).
- Reduce manual effort and potential errors in setting up virtual machines.

With this script, you can deploy a VM in a few simple steps, customize it with your desired specifications, and get up and running in Azure.

## Prerequisites
Before running the script, make sure you have the following:
1. **Microsoft Azure Account**: An active Azure account is required to create resources in Azure.
2. **Azure CLI**: You need to have the Azure CLI installed on your machine. You can install it by following the instructions [here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Login to Azure**: Log in to your Azure account using the `az login` command to authenticate the Azure CLI.
4. **Sufficient Permissions**: You should have the necessary permissions to create resources in the Azure subscription, including resource groups, virtual networks, storage accounts, and VMs.

## Steps to Use

### 1. Clone the Repository
Start by cloning this GitHub repository to your local machine:
```bash
git clone https://github.com/yourusername/azure-vm-setup.git
cd azure-vm-setup
```
### 2. Open the Script

Open the vm_setup.sh (for Linux/MacOS) or vm_setup.ps1 (for Windows) script file in a text editor (like Notepad or VSCode) and review the content.

### 3. Modify the Script (Optional)

You may need to adjust the following parameters in the script before running it:

1. VM Name: The name of the virtual machine.
2. Resource Group: The Azure resource group in which the VM will reside.
3. Region: The Azure region where the resources will be created (e.g., eastus, westeurope).
4. VM Size: The size of the virtual machine (e.g., Standard_B1s, Standard_D2_v2).
5. OS Image: The operating system image to use for the VM (e.g., UbuntuLTS, WindowsServer2019Datacenter).
6. Admin Username and Password: The administrator credentials for accessing the VM.
7. SSH Key: (Optional) If you're using SSH keys for authentication instead of a password.

### 4. Run the Script

For Linux/MacOS:
1. Open a terminal window.
2. Navigate to the directory where you cloned the repository.
3. Run the following command:

```bash
chmod +x vm_setup.sh
./vm_setup.sh
```

For Windows:
1. Open PowerShell as Administrator.
2. Navigate to the directory where you cloned the repository.
3. Run the following command:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\vm_setup.ps1
```

### 5. Follow the Prompts

The script will prompt you to confirm your choices for the resource group, region, and VM specifications. It will then proceed with the creation process, showing progress as it goes.

### 6. Access Your Virtual Machine

Once the VM is created, you will be given the public IP address to access it. If it's a Linux VM, you can use SSH:
```bash
ssh azureuser@<your-vm-ip>
```

For Windows VMs, you can connect using Remote Desktop Protocol (RDP).

### Example output
```text
Logging in to Azure...
Creating resource group...
Creating virtual machine...
Opening SSH port 22...
Retrieving the public IP address...
Public IP: 20.30.40.50
```
