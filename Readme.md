# Initial setup

- Prepare Azure subscription for the lab.
- Make sure you are a contributor of the subscruption.
- To access VM and Cloud Sehll, make sure you can access *(outbound) TCP 22 port* from your network.

## Agenda

## Before workshop let's discuss about Azure IaaS

- Azure Infrastructure as a Service Introduction (30 mins)
  - Azure Resource Manager
  - Regions and Availability
  - VM Types and sizes
  - Storage
  - Networking
  - Monitoring
  - Backup and recovery

## Understand lab scenarios

- Workshop Scenario introduction (10 mins)
  - Create web app dev/test VM
  - Capture customized VM images
  - Create web servers from custom VM image
  - (Optional) Create load balancer

## Create Resource Group

> *[NOTE]*: If you already have a resource group for the lab, you can skip this step. But, note that you must have *owner* permission of the resource group for hands on lab.

1. Create resource group

    Click '+ new' and search 'Resource group'.

    ![new icon](/3.%20Hands%20on%20Labs/3.1.%20Create%20Virtual%20Network/images/3.1.0.png)

    Use following name and location for the lab

    |Name|Subscription|Location|
    |---|---|---|
    |web-dev-wus-rg|*yoursubscription*|*West US*|

> *[NOTE]*: Please check 'Pin to Dashboard' so you can access the resource easy.

## Click each folling link for HOL

- Hands on Labs (2 Hours)
  1. [Create Virtual Network](3.%20Hands%20on%20Labs/3.1.%20Create%20Virtual%20Network/Readme.md)
  1. [Manage NSG](3.%20Hands%20on%20Labs/3.2.%20Manage%20NSG/Readme.md)
  1. [Create custom VM image](3.%20Hands%20on%20Labs/3.3.%20Create%20custom%20VM%20Image/Readme.md)
  1. [Create web servers from custom VM image](3.%20Hands%20on%20Labs/3.4.%20Create%20VM%20Portal/Readme.md)
  1. [Move VM using Azure cli](3.%20Hands%20on%20Labs/3.5.%20Create%20VM%20Cli/Readme.md)
  1. [Create Application Gateway](3.%20Hands%20on%20Labs/3.6.%20Application%20Gateway/Readme.md)

---

## *Tips* for Hands on Lab

## 1. Make your own Azure Portal Dashboard

Please follow next two steps to create your own dashboard first.

1. Log on [Azure portal](https://portal.azure.com).

1. Click '+ New Dashboard' on the portal.

  ![alt text](./3.%20Hands%20on%20Labs/images/3.0.1.png)

  Change name of the dashboard and click 'Done customizing' to save name. And you'll see empty dashboard.

  ![alt text](./3.%20Hands%20on%20Labs/images/3.0.2.png)

## 2. Pin to dashboard

When you create resource you'll see 'Pin to dashboard'. Check the box when you create a resource so you can have short cut to access to a resource.

  ![alt text](./3.%20Hands%20on%20Labs/images/3.0.3.png)

## 3. Use search to find your resource or Azure service

To find your specific resource you can use search at the Azure portal.

  ![alt text](./3.%20Hands%20on%20Labs/images/3.0.5.png)

---

[Next Lab 1.>>](https://github.com/xlegend1024/az-infra-wrkshp-101/tree/master/3.%20Hands%20on%20Labs/3.1.%20Create%20Virtual%20Network)