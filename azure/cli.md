Azure CLI
=========

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
