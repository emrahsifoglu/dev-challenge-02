# Sign in to your Azure account
Connect-AzAccount

# Variables
$resourceGroupName = "rg"
$storageAccountName = "devordersa"
$location = "West Europe"
$containerName = "orders"

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2
$ctx = $storageAccount.Context

# Create a new storage container
New-AzStorageContainer -Name $containerName -Context $ctx

# Enable blob soft delete
Enable-AzStorageBlobDeleteRetentionPolicy -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -RetentionDays 30

# Enable versioning
Update-AzStorageBlobServiceProperty -ResourceGroupName $resourceGroupName `
    -StorageAccountName $storageAccountName `
    -IsVersioningEnabled $true

# Display confirmation
Write-Output "Azure Blob Storage deployment completed with versioning and soft delete configured."
