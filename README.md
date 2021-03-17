- [SUSE Manager + Rancher + K3s/RKE Automation](#suse-manager--rancher--k3srke-automation)
  - [Setup SUSE Manager Server](#setup-suse-manager-server)
    - [Create Activation keys](#create-activation-keys)
  - [Setup OS Image Build Host](#setup-os-image-build-host)
    - [Create OS Image from template](#create-os-image-from-template)
  - [Salt Pillar Creation](#salt-pillar-creation)
  - [Configuration Channels Setup](#configuration-channels-setup)
    - [Master node channels](#master-node-channels)
    - [Worker node Channels](#worker-node-channels)
  - [Salt States](#salt-states)
  - [Image Deployment](#image-deployment)


# SUSE Manager + Rancher + K3s/RKE Automation

Automation of Rancher, K3s, RKE, RKE2 through Salt and SUSE Manager

The goal of the information here is to demonstrate how you can use SUSE Manager to automate the deployment of a SLES 15 SP2+ image and install K3s upon activation against a SUSE Manager Server. Once activated and K3s is installed you can also automate the creation of a Rancher cluster and register the installed K3s node to the Rancher cluster. There are variations of this that will work in different ways and I will call those out in the various sections since you may want to use that variation in another use case. Once you have one K3s node installed and registered to Rancher then you can also add a second k3s node as a worker or another master for your design configuration.
There is great value in the use of this method for deployment and here is a list of those values you can realize when you have this all setup.  
- Activated systems with SUSE Manager get full patch/update lifecycle management.  
- Activated systems with SUSE Manager get full monitoring with Prometheus Exporters (Optional Setup).
- Full Image lifecycle/rebuild with the SLE-Build-Host so new deployments are patched.
- Full audit capabilities from SUSE Manager
- Full configuration management functionality with Salt.  

Requirements for setup and use:   
Follow each section in full to get yourself into a working state.   
- Setup SUSE Manager Server
- Setup SLE Build Host
- Salt Pillar
- Configuration Channels
  - Master node channels
  - Worker node channels  
- Salt States
- Image Deployment
## Setup SUSE Manager Server
The recommendation here is to follow the SUSE Manager documentation for requirements, setup, and deployment.  
Installing SUSE Manager for testing can be done fairly quickly if you have available all of the packages and media downloaded to an RMT (Repository Mirroring Tool) Server. To setup and install an RMT Server and mirror the software repositories you will be using in SUSE Manager you can reference [SLES RMT documentation](https://documentation.suse.com/sles/15-SP2/html/SLES-all/cha-rmt-installation.html).   
For a quick installation and instruction on how to get up and running please reference the [SUSE Manager Documentation](https://documentation.suse.com/external-tree/en-us/suma/4.1/suse-manager/installation/install-server-unified.html).  
The remaining instructions can also be used with Uyuni as well. If you would prefer to test with Uyuni then you can reference the [Uyuni documentation](https://www.uyuni-project.org/uyuni-docs/uyuni/installation/install-overview.html).  
### Create Activation keys
Activation keys are used to ensure that your deployed images have correct software entitlements, software channels, subscribed to any relevant groups, and configuration channels applied. More is explained in the [SUSE Manager Documentation on Activation Keys](https://documentation.suse.com/external-tree/en-us/suma/4.1/suse-manager/client-configuration/activation-keys.html).  
Lets create a few activation keys.  
Navigate to Systems --> Activation Keys  
![Activation Keys](/png/activation_key1.png)  
In this example we will create two activation keys. The keys will be called k3s and k3s-agent.  
Click + Create Key in the upper right corner  
Fill in the values (These can be different than the example below)  
Description: k3s  
Key: 1-sle15sp2-k3s  
Usage: leave blank  



## Setup OS Image Build Host
This is a separate host from the SUSE Manager server that will be used to primarily build OS images.  
Once you have a separate host setup for use and activated to SUSE Manager it can be designated in the properties as an OS Image Build Host.
The configuration and setup of an OS Build Host is best described in the [Image Building Documentation](https://documentation.suse.com/external-tree/en-us/suma/4.1/suse-manager/administration/image-management.html#at.images.kiwi.buildhost). Once you have this setup we are ready to build a few images for our use case.  
### Create OS Image from template

## Salt Pillar Creation  

## Configuration Channels Setup

### Master node channels

### Worker node Channels

## Salt States

## Image Deployment


