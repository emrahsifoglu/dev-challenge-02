# Import the Pester module
Import-Module Pester

# Sign in to your Azure account
$context = Get-AzContext  

if (!$context) {  
    Connect-AzAccount  
} else {
    Write-Host "Already connected"
}

# Describe block to group related tests
Describe "Azure Blob Storage Configuration Tests" {
    Context "Storage Account Configuration" {
        It "Verifies if the storage account exists" {
            $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
            $storageAccount | Should -Not -Be $null
        }

        It "Verifies if the storage account kind is StorageV2" {
            $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
            $storageAccount.Kind | Should -Be "StorageV2"
        }

        It "Verifies if the storage account is in the correct location" {
            $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
            $storageAccount.Location | Should -Be $location
        }
    }

    Context "Blob Container Configuration" {
        BeforeAll {
            $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
            $ctx = $storageAccount.Context
        }

        It "Verifies if the blob container exists" {
            $container = Get-AzStorageContainer -Name $containerName -Context $ctx
            $container | Should -Not -Be $null
        }

        It "Verifies if soft delete is enabled" {
            $deleteRetentionPolicy = Get-AzStorageServiceProperty -ServiceType Blob -Context $ctx | Select-Object -ExpandProperty DeleteRetentionPolicy
            $deleteRetentionPolicy.Enabled | Should -Be $true
            $deleteRetentionPolicy.RetentionDays | Should -Be 30
        }
    }
}
