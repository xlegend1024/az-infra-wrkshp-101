# Create VM from customized VM image
Create customized VM using [Azure cli](https://azure.github.io/projects/clis/).
During the labs, we are going to use [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)

## Create new Virtual Network
Create new Virtual Network and subnet before provision production webapp.

> Before run next command, modify resource group name first.

    rgName=typeyourresourcegruopnameandrun
    vnetName=prd-westus-vnet
    subName=web

Run following command to create new Virtual Network and subnet. 
```bash
az network vnet create -g $rgName -n $vnetName --address-prefix '10.1.0.0/16' --subnet-name $subName --subnet-prefix '10.1.1.0/24' 
```

## Create and apply new NSG
Create new NGS for prodcution webapp VM. The new NGS will allow only TCP 80 port (HTTP). TCP 22 port (SSH) will be disabled.

1. Create new NSG
```bash
nsgName=webapp-prd-nsg
az network nsg create -g $rgName -n $nsgName
```

2. Set a rule
```bash
az network nsg rule create -g $rgName --nsg-name $nsgName --direction Inbound -n HTTP --priority 110 --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 80 --access allow --protocol Tcp
```

3. Apply NSG to subnet
```bash
az network vnet subnet update -g $rgName -n $subName --vnet-name $vnetName --network-security-group $nsgName
```

## Create VM 

1. Create VM from images. Click the image.

![alt text](./images/3.4.1.png)

2. Click '+ Create VM'.

![alt text](./images/3.4.3.png)

3. Fillout form.

    |Name|VM Disk Type|User Name|Authentication Type|Password|Subscription|Resource Group|Location|
    |---|---|---|---|---|---|---|---|
    |web-prd-01|SSD|azureadmin|Password|P@ssword1234|*yoursubscription*|*yourresourcegroup*|West US|

4. Choose VM size

![alt text](./images/3.4.5.png)


5. Settings for VM
    * High Availability
        - Create new availability set

            |Availability Zone|Availability Set|
            |---|---|
            |None|web-set|

            ![alt text](./images/3.4.6.png)

    * Network
        - Choose prodcution virtual network, subnet and NSG 

        ![alt text](./images/3.4.7.png)

    * Extensions
        - Leave it as default (none).

    * Auto-Shutdown
        - Leave is as default, 'Off'.
    * Monitoring
        - Disable both 'Boot diagnostics' and 'Guest OS diagnostics'.
        
        ![alt text](./images/3.4.8.png)

8. Review summary and Click 'Create'.

