param (
    [String] $resourceGroupName = "rg",
    [String] $storageAccountName = "devordersa",
    [String] $containerName = "orders",
    [String] $location = "westeurope"
)

Invoke-Pester -Path .\tests\PesterTest.ps1 
