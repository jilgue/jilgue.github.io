# Azure CLI

## Azure CLI

Install: `pikaur -S azure-cli --noconfirm`

Login: `az login`

Account details: `az account list` o `az account list -o table`

CLI configuration: `/home/cmartin/.azure/config` `az configure`

"Auto completion": `az interactive`

Outputs:
* `-o yaml`
* `-o table`

Query (JMESTPath):
* `az group list --query "[?location=='australiasoutheast']"`
* `az group list --query "[?location=='australiasoutheast'].{RGName:name,ID:id}" -o table`

SQL server
https://docs.microsoft.com/es-es/azure/azure-sql/database/connectivity-settings
```
# Get current setting for Public Network Access
az sql server show -n sql-server-name -g sql-server-group --query "publicNetworkAccess"

# Update setting for Public Network Access
az sql server update -n sql-server-name -g sql-server-group --set publicNetworkAccess="Disabled"

```

```
mssql-cli -S sql-sl01-dev01-paa01-weu-01.database.windows.net -d sdb-sl01-dev01-paa01-weu-01 -U user -P password
```


### IAM

`az role assignment list --subscription sus-azu-sls-sl01-dev01-paa01-01 --output json --query '[].{principalName:principalName, roleDefinitionName:roleDefinitionName, scope:scope}'`

`az ad sp list --display-name spn-automation-arm-sl01-dev01-paa01`

## Databricks

```
$ source ~/venv/py3/bin/activate
$ pip install databricks-cli

$ databricks configure --token
Databricks Host (should begin with https://): https://adb-6594245204029657.17.azuredatabricks.net
Token: dapia0821d32b277380a95732ce3ade9bd79

$ dbfs ls dbfs:/dummy
paa-ingestion-1.0.0-SNAPSHOT-assembly.jar

```


```
databricks libraries uninstall --all --cluster-id 0629-142723-sylph445
```

## Azure PowerShell

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

### Analysis Services

https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-create-powershell

## Azure Resource Manager (ARM)

[https://docs.microsoft.com/es-es/azure/azure-resource-manager/](https://docs.microsoft.com/es-es/azure/azure-resource-manager/)

Resources reference: [https://docs.microsoft.com/es-es/azure/templates/](https://docs.microsoft.com/es-es/azure/templates/)

### My first template

```json
 {
  "$schema":  "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": []
}
```

```bash
$ az login
$ az group create \
  --name myResourceGroup \
  --location "Central US"
$ templateFile="{provide-the-path-to-the-template-file}"
$ az deployment group create \
  --name blanktemplate \
  --resource-group myResourceGroup \
  --template-file $templateFile
```

With parameters in a json file
```bash
$ templateFile="{path-to-the-template-file}"
$ devParameterFile="{path-to-azuredeploy.parameters.dev.json}"
$ az group create \
  --name myResourceGroupDev \
  --location "East US"
$ az deployment group create \
  --name devenvironment \
  --resource-group myResourceGroupDev \
  --template-file $templateFile \
  --parameters $devParameterFile
  ```

## Storage Account

`az storage account network-rule add --resource-group "reg-sl01-dev01-paa01-weu-gen-01" --account-name "stasl01dev01paa01weu01" --ip-address "47.61.177.120"`
