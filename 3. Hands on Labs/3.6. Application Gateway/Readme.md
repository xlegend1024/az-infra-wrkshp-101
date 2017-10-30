## Add new subnet
Create new subnet before provision production webapp.

> Before run next command, modify resource group name first.
> If a resource is not exits with following name, you'll see an error.

    rgName=typeyourresourcegruopnameandrun
    vnetName=prd-westus-vnet
    subName=appgtwy

```bash
az network application-gateway create -g $rgName -n "appgtwy" \
    --capacity 2 --sku WAF_Medium \
    --vnet-name $vnetName \
    --subnet-address-prefix "10.1.101.0/24" \
    --subnet $subName
    --address-prefix '10.1.100.0/24' 
```
