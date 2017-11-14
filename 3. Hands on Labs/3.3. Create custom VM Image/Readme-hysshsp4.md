# Create custom VM image
Create linux Virtual Machie from Azure Marketplace. And create web app VM image for production environment.

## Architecture 
![alt text](/3.%20Hands%20on%20Labs/images/3.3.1.png)

### Create Ubuntu VM
1. Click *+New* and search 'ubuntu'.

    ![alt text](./images/3.3.0.png)

2. From the search result, select 'Ubuntu Server 16.04 LTS'.

    ![alt text](./images/3.3.1.png)

3. Click *Create*.

    ![alt text](./images/3.3.2.png)


4. Please use below table to fillout the form.

    |Name|VM Disk Type|User Name|Authentication Type|Password|Subscription|Resource Group|Location|
    |---|---|---|---|---|---|---|---|
    |web-dev-ubt|SSD|azureadmin|Password|P@ssword1234|*yoursubscription*|*yourresourcegroup*|West US|


5. Choose VM Size

    ![alt text](./images/3.3.3.png)


6. Settings for VM
    * High Availability 
        - Keep the default options.

            |Availability Zone|Availability Set|
            |---|---|
            |None|None|

    * Storage
        - Keep the default option. 
    
            |Use Managed Disks|
            |---|
            |Yes|
        
    * Network
        - Choose development virtual network and subnet.
        
        ![alt text](./images/3.3.4.png)


    * Extensions
        - Add Extension
        
        ![alt text](./images/3.3.5.png)

        - Download the sample script from [here](https://raw.githubusercontent.com/xlegend1024/az-infra-wrkshp-101/master/9.%20Resources/script.sh). 

        - Upload the script.
        
        ![alt text](./images/3.3.6.png)

    * Auto-Shutdown
        - Leave is as default, 'Off'.
    * Monitoring
        - Disable both 'Boot diagnostics' and 'Guest OS diagnostics'.

7. Review summary and click *Create* to provision a VM. (It'll takes around 5 minutes.)
    * VM creation includes:
        * Create VM
        * Update OS
        * Install Apache
        * Download and Install sample Web app
    * When the provisioning is done you will see detail information like following.
        
        ![alt text](./images/3.3.8.png)
        > let's note the ip address of the VM for later use.

8. Deprovision<br>
Deprovisioning will attempt to generalize the image. Attempt to clean the system and make it suitable for re-provisioning. </br>
This operation deleted the following:
    * All SSH host keys (if Provisioning.RegenerateSshHostKeyPair is 'y' in the configuration file)
    * Nameserver configuration in /etc/resolv.conf
    * Root password from /etc/shadow (if Provisioning.DeleteRootPassword is 'y' in the configuration file)
    * Cached DHCP client leases
    * Resets host name to localhost.localdomain

    8.1. Access VM
    Launch [Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart) by clicking icon, ![alt text](./images/3.3.91.png), on top of azure portal.</br>
    And in the Cloud Shell run ssh command to access the VM. 
    ![alt text](./images/3.3.10.png)

    8.2. Run deprovisoning command and proceed the command by typing 'y'.
    ```
    sudo waagent -deprovision+user
    ```

    ![alt text](./images/3.3.11.png)

1. Shutdown VM

Click ![alt text](./images/3.3.12.png) and stop the VM.

## Capture VM as customized image

1. Capture VM

When VM is stoped click ![alt text](./images/3.3.14.png).
Change image name like following.

    |Name|Resource Group|delete VM|
    |:---:|---|---|
    |web-ver1-image|*yourresourcegroup*|yes|

    ![alt text](./images/3.3.15.png).

## Architecture 
When captruing is done, your vm in no longer exisit. So your current architecture will look like following.
![alt text](/3.%20Hands%20on%20Labs/images/3.3.2.png)

<hr>

[Next Lab 4.>>](https://github.com/xlegend1024/az-infra-wrkshp-101/tree/master/3.%20Hands%20on%20Labs/3.4.%20Create%20VM%20Portal)