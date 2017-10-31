# Create Application Gateway for Webapp
Create new subnet before provision production webapp. Launch [Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart) for this lab.

> Before run next command, modify resource group name first.
> If a resource is not exits with following name, you'll see an error.
```bash
rgName=typeyourresourcegruopnameandrun
vnetName=prd-westus-vnet
subName=appgtwy
```

1. Create Application Gateway

Run below command in the Cloud Shell to create Application Gateway.

```bash
az network application-gateway create -g $rgName -n "appgtwy" \
    --capacity 2 --sku WAF_Medium \
    --vnet-name $vnetName \
    --subnet-address-prefix "10.1.101.0/24" \
    --subnet $subName
    --address-prefix '10.1.100.0/24' 
```

2. Add backend pool. 

```bash
az network application-gateway address-pool create -g $rgNAme --gateway-name "appgtwy" -n "webpool" --servers 10.1.1.4 10.1.1.5
```
