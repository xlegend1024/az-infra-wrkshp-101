# Create VM from customized VM image

## Add new subnet
Create new subnet before provision production webapp.

> Before run next command,declare a variable for resource group name first

    rgName=typeyourresourcegruopnameandrun
    vnetName=prd-westus-vnet
    subName=web

Run following command to create new Virtual Network and subnet. 
```bash
az network vnet create -g $rgName -n $vnetName --address-prefix '10.1.0.0/16' --subnet-name $subName --subnet-prefix '10.1.1.0/24' 
```

## Add new NSG
Create new NGS for prodcution webapp VM. The new NGS will allow only TCP 80 port (HTTP). TCP 22 port (SSH) will be disabled.
1. Create new NSG
```bash
nsgName=webapp-prd-nsg
az network nsg create -g $rgName -n $nsgName
```

1. Set a rule
```bash
az network nsg rule create -g $rgName --nsg-name $nsgName --direction Inbound -n HTTP --priority 110 --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 80 --access allow --protocol Tcp
```

1. Apply to subnet
```bash
az network vnet subnet update -g $rgName -n $subName --vnet-name $vnetName --network-security-group $nsgName
```

## Create VM 
Create VM from images. Click the image.

![alt text](./images/3.4.1.png)


