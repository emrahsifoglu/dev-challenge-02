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
![deploy](/images/deploy.png)

### Testing
#### Install Pester Module
Run the command below in a PowerShell to install the Pester module:
```ps
Install-Module -Name Pester -Force -SkipPublisherCheck
```
#### Invoke Pester Test
###### run
```ps
./PesterTest.ps1
```
###### console output
![test](/images/test.png)

### Resources

- https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-powershell
- https://stackoverflow.com/questions/24156451/powershell-the-term-is-not-recognized-as-cmdlet-function-script-file-or-operable
- https://www.youtube.com/watch?v=_szh3XCyTo0
- https://github.com/Azure/azure-powershell
- https://learn.microsoft.com/en-us/answers/questions/938968/check-if-im-logged-to-azure-or-not-using-powershel
- https://stackoverflow.com/questions/44051241/how-to-catch-exceptions-on-powershell
- https://stackoverflow.com/questions/37598086/check-if-azure-resource-group-exist-azure-powershell
- https://stackoverflow.com/questions/72780424/stop-return-information-returning-when-using-set-azstorageblobcontent
- https://www.jorgebernhardt.com/soft-delete-azure-storage/

