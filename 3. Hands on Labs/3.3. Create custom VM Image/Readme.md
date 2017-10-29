# Create custom VM image

## Create web dev VM
### Create Ubuntu VM
1. Click *+New* and search 'ubuntu'.

    ![alt text](./images/3.3.0.png)


2. From the search result, select 'Ubuntu Server 16.04 LTS'.

    ![alt text](./images/3.3.1.png)


3. Click *Create*.

    ![alt text](./images/3.3.2.png)


4. Fillout the from using following table. 

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

7. Review summary and click *Create* to provision a VM. (Might takes 5 minutes.)
    * VM creation will include:
        * Create VM
        * Update OS
        * Install Apache
        * Install sample Web app
    * When the provisioning is done you will see detail information like following.
        
        ![alt text](./images/3.3.8.png)
        > let's note the ip address of the VM for later use.

8. Deprovision
Run bash shell by clicking icon, ![alt text](./images/3.3.91.png), on top of azure portal.

    8.1. Access VM

    Run ssh to access the VM. 
    ![alt text](./images/3.3.10.png)

    8.2. Run deprovisoning command
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


