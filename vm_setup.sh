#!/bin/bash

# Variables
RESOURCE_GROUP="myResourceGroup"
LOCATION="eastus"
VM_NAME="MyVM"
VM_SIZE="Standard_B1s"
OS_IMAGE="UbuntuLTS"
ADMIN_USERNAME="azureuser"
ADMIN_PASSWORD="Password123!"
SSH_KEY_PATH="~/.ssh/id_rsa"

# Log in to Azure (prompt will appear)
echo "Logging in to Azure..."
az login

# Create a resource group
echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a virtual machine
echo "Creating virtual machine..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --size $VM_SIZE \
  --image $OS_IMAGE \
  --admin-username $ADMIN_USERNAME \
  --admin-password $ADMIN_PASSWORD \
  --generate-ssh-keys

# Open SSH port
echo "Opening SSH port 22..."
az vm open-port --port 22 --resource-group $RESOURCE_GROUP --name $VM_NAME

# Get the public IP address
echo "Retrieving the public IP address..."
az vm list-ip-addresses --resource-group $RESOURCE_GROUP --name $VM_NAME --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv
