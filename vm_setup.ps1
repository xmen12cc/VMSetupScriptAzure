# Variables
$resourceGroup = "myResourceGroup"
$location = "eastus"
$vmName = "MyVM"
$vmSize = "Standard_B1s"
$osImage = "UbuntuLTS"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "Password123!" -AsPlainText -Force
$sshKeyPath = "~/.ssh/id_rsa"

# Log in to Azure (prompt will appear)
Write-Host "Logging in to Azure..."
az login

# Create a resource group
Write-Host "Creating resource group..."
az group create --name $resourceGroup --location $location

# Create a virtual machine
Write-Host "Creating virtual machine..."
az vm create `
  --resource-group $resourceGroup `
  --name $vmName `
  --size $vmSize `
  --image $osImage `
  --admin-username $adminUsername `
  --admin-password $adminPassword `
  --generate-ssh-keys

# Open SSH port
Write-Host "Opening SSH port 22..."
az vm open-port --port 22 --resource-group $resourceGroup --name $vmName

# Get the public IP address
Write-Host "Retrieving the public IP address..."
$publicIp = az vm list-ip-addresses --resource-group $resourceGroup --name $vmName --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv
Write-Host "Public IP: $publicIp"
