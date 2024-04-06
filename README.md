### Prerequisite

Run the command below in a PowerShell session to install the Az PowerShell module:

```ps
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

If you have an earlier version installed from the PowerShell Gallery, run the following command to update:

```ps
Update-Module -Name Az -Scope CurrentUser -Force
```

### Deploy Blob Storage
The PowerShell script ```DeployBlobStorage.ps1``` will deploy Azure Blob Storage, configures blob versioning, soft delete.

###### run
```ps
./DeployBlobStorage.ps1
```

###### console output
```console
Azure Blob Storage deployment completed with versioning and soft delete configured.
```

### Resources

- https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-powershell
- https://stackoverflow.com/questions/24156451/powershell-the-term-is-not-recognized-as-cmdlet-function-script-file-or-operable
- https://www.youtube.com/watch?v=_szh3XCyTo0
- https://github.com/Azure/azure-powershell