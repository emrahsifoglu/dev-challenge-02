### Prerequisite

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [VSCode](https://code.visualstudio.com/download)

### Initial setup

Follow instructions shown by VSCode to run the project in (dev) container.

![reopen](/images/reopen.png)

Then run the command below in a PowerShell session to install the Az PowerShell module.

```ps
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

If you have an earlier version installed from the PowerShell Gallery, run the following command to update.

```ps
Update-Module -Name Az -Scope CurrentUser -Force
```

### Deploy Blob Storage
The PowerShell script ```DeployBlobStorage.ps1``` will deploy Azure Blob Storage, configures blob versioning, soft delete.
To connect Azure, follow insturctions follow instruction shown in console.

###### run
```ps
./DeployBlobStorage.ps1
```

###### console output
![connect](/images/connect.png)

If you are already authenticated then you will see output "Already connected" and script will be executed right away.

###### console output
![deploy](/images/deploy.png)

### Testing
#### Install Pester Module
Run the command below in a PowerShell to install the Pester module:
```ps
Install-Module -Name Pester -Force -SkipPublisherCheck
```
#### Invoke Pester Test
The script ```InvokePester.ps1``` will run the ```PesterTest.ps1``` in tests folder.

###### run
```ps
./InvokePester.ps1
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
- https://learn.microsoft.com/en-us/answers/questions/162802/when-i-am-trying-to-connect-to-my-azure-portal-thr
