# Azure Resource Manager (ARM)

[https://docs.microsoft.com/es-es/azure/azure-resource-manager/](https://docs.microsoft.com/es-es/azure/azure-resource-manager/)

Resources reference: [https://docs.microsoft.com/es-es/azure/templates/](https://docs.microsoft.com/es-es/azure/templates/)

## My first template

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
