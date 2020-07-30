# Azure PowerShell

start `pwsh`

login `Connect-AzAccount` -> use a web browser to open the page https://microsoft.com/devicelogin and enter the code

https://docs.microsoft.com/en-us/powershell/azure/install-Az-ps?view=azps-4.3.0
 Install:
 ```
 if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
}
 ```

Check install: `Import-Module Az.AnalysisServices`

## Analysis Services

https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-create-powershell
