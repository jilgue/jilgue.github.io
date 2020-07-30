# Databricks

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
