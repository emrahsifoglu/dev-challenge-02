
# Sign in to your Azure account
$context = Get-AzContext  

if (!$context) {  
    Connect-AzAccount  
} else {
    Write-Host "Already connected"
}

# Variables
$resourceGroupName = "rg"
$storageAccountName = "devordersa"
$location = "West Europe"
$containerName = "orders"
$percentComplete = 0

Write-Progress -Activity "%$percentComplete" -Status "Creating a resource group" -PercentComplete $percentComplete
Start-Sleep -Milliseconds 250
$percentComplete += 20

# Create a new resource group
if (!(Get-AzResourceGroup $resourceGroupName -ErrorAction SilentlyContinue))
{  
    New-AzResourceGroup -Name $resourceGroupName -Location $location | Out-Null
}
else
{  
    Write-Warning "Provided resource group already exists"
}

Write-Progress -Activity "%$percentComplete" -Status "Creating a storage account..." -PercentComplete $percentComplete
Start-Sleep -Milliseconds 250
$percentComplete += 20

# Create a storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName  `
                    -Name $storageAccountName -SkuName Standard_LRS  `
                    -Location $location -Kind StorageV2  `
                    -ErrorAction SilentlyContinue -ErrorVariable ErrVar | Out-Null
if ($ErrVar) {
    Write-Warning "The storage account named '$storageAccountName' is already taken"
}

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$ctx = $storageAccount.Context

Write-Progress -Activity "%$percentComplete" -Status "Creating a new storage container" -PercentComplete $percentComplete
Start-Sleep -Milliseconds 250
$percentComplete += 20

# Create a new storage container
if (!(Get-AzStorageContainer -Name $containerName -Context $ctx -ErrorAction SilentlyContinue))
{  
    New-AzStorageContainer -Name $containerName -Context $ctx | Out-Null
}
else
{  
    Write-Warning "Container '$containerName' already exists"
}

Write-Progress -Activity "%$percentComplete" -Status "Enable blob soft delete" -PercentComplete $percentComplete
Start-Sleep -Milliseconds 250
$percentComplete += 20

# Enable blob soft delete
Enable-AzStorageBlobDeleteRetentionPolicy -ResourceGroupName $resourceGroupName  `
    -StorageAccountName $storageAccountName  `
    -RetentionDays 30 | Out-Null

Write-Progress -Activity "%$percentComplete" -Status "Enable versioning" -PercentComplete $percentComplete
Start-Sleep -Milliseconds 250
$percentComplete += 20

# Enable versioning
Update-AzStorageBlobServiceProperty -ResourceGroupName $resourceGroupName `
    -StorageAccountName $storageAccountName `
    -IsVersioningEnabled $true | Out-Null

Write-Progress -Activity "%$percentComplete" -Status "Completed" -PercentComplete $percentComplete
Write-Output "Azure Blob Storage deployment completed with versioning and soft delete configured."
Start-Sleep -Milliseconds 250
