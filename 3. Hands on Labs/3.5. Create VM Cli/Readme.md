# Create VM from customized VM image using Azure Cli
Create customized VM using [Azure cli](https://azure.github.io/projects/clis/). During the labs, we are going to use [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)

## Move VHD
Scenario

1. Create Blob

    Scenario

    Use following command:
```bash
blobName=changeblobname
az storage account check-name --name $blobName
```

2. Create Blob account and container

    Scenario
    
    Use following command:
```bash
az storage account create -g $rgName -n $blobName --sku Standard_LRS
blobConn=$(az storage account show-connection-string --resource-group $rgName --name $blobName  --output tsv)
az storage container create -n vhds --connection-string $blobConn
```

3. Move VHD

    Copy VHD from on-premise to azure blob

    Use following command:
```bash
blobKey=$(az storage account keys list -g $rgName -n $blobName --query [].[value][0] --output tsv)
azcopy --source:https://workshopiaasmtcseagp.blob.core.windows.net/vhds/ --source-key "9cAiVFEmnOXJ/gYQ1DDOrtjrQDN1CevGQ3OfX+sL/QMoMPaZ2ti3zUy2Od60wAmYcNp4nlMQ872HSPnPLOaYhg==" \
    --destination https://$blobName.blob.core.windows.net/vhds/ --dest-key $blobKey \
    --include "iaaslablinuxvm20171024162330.vhd"
```

3. Create managed disk from blob

    what

    Use following command:
```bash
az storage blob list --container-name vhds --connection-string $blobConn --output table
blobURL=$(az storage blob url --container-name vhds --name "iaaslablinuxvm20171024162330.vhd" --connection-string $blobConn --output tsv)
```

4. Create Image from managed disk 

    Use following command:
```bash
az disk create -g $rgName --name "web-ubt-os-disk" --sku Premium_LRS --source $blobURL
```


5. Create VM
    Scenario

    Use following command:
```bash
az image create -g $rgName -n "migrated-web-ubt-img" --source "web-ubt-os-disk" --os-type linux
```

6. Run cli commnad

    what 

    Use following command:
```bash
az vm create --resource-group $rgName --name "web-prd-02" --image "migrated-web-ubt-img" \
    --admin-username "azureadmin" \
    --admin-password "P@ssword1234" \
    --availability-set "web-set" \
    --vnet-name $vnetName \
    --subnet $subName \
    --nsg $nsgName
```

