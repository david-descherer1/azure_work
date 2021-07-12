# <div align="center"> em_vm </div>
#### <div align="center">***v0.0.1***</div>

#### <div align="center">David Elbert<sup>1</sup>, David DeScherer<sup>2</sup></div>

<div align="center"><sup>1</sup>Hopkins Extreme Materials Institute (HEMI), PARADIM Materials Innovation Platform, and Dept. of Earth and Planetary Sciences, The Johns Hopkins University, Baltimore, MD, USA</div>
<div align="center"><sup>2</sup>Dept. of Mechancial Engineering, The Johns Hopkins University, Baltimore, MD, USA</div>

## Introduction
Modular Azure VM builder for Azure CLI written in Shell and Powershell with JSON.

Available on GitHub at https://github.com/paradimdata/em_vm

(Need to find the info for what grant this is)

## Installation
The files in this repository can either be downloaded or cloned onto local computer for use.


## Using the Software
This software will create a virtual machine and additional needed resources under the users Azure Subscription. An active Azure subscription is required to create the virtual machine. Once the virtual machine is made, the user will be able to view and connect to it through the Azure Portal.

#### If using the Azure CLI, this can be skipped.
1. In order to run the software locally, the Azure CLI must be installed. Instructions for installation can be found at this [link](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

1. The user must then log in to their Azure Subscription using `az login`.

1. If this is their first time using the Azure CLI, they must check and possibly register the Azure Image Builder features. 
    * The following code should be run to check the registration.
    ``` 
    az provider show -n Microsoft.VirtualMachineImages | grep registrationState
    az provider show -n Microsoft.KeyVault | grep registrationState
    az provider show -n Microsoft.Compute | grep registrationState
    az provider show -n Microsoft.Storage | grep registrationState
    az provider show -n Microsoft.Network | grep registrationState
    ```
    * If the features are not registered, the following code should be run to register the features. It may take a few minutes to register the features.
    ```
    az provider register -n Microsoft.VirtualMachineImages
    az provider register -n Microsoft.Compute
    az provider register -n Microsoft.KeyVault
    az provider register -n Microsoft.Storage
    az provider register -n Microsoft.Network
    ```

### Script Setup

The `vmFormat.sh` (or other versions) script is the only script that should be run. `vmFormat.sh` must be customized before use. While `vmFormat_prompt.sh` will use the users input, and `vmFormat_config` will use a config file given by the user. Users should have a plan of variable names before using any script. 

When downloaded, `vmFormat.sh` will not have permission to be executed on the local computer. `chmod +x vmFormat.sh` or prefered change to permissions will need to be run to execute `vmFormat.sh`. 

The script can then be run using the command `./vmFormat.sh` when the user is in the directory where `vmFormat.sh` is located. The total time to create the virtual machine should be between 30 minutes to 1 hour, but the process should be monitired.

If using `vmFormat_config.sh`, a config file named `config.cfg` must be located in the same directory. A template for the config file is located in the repository. Before the script is run, the config file must be edited to the users specifications. 

It should also be noted that the password for the virtual machine should be between 12-30 characters and should contain a special character, uppercase and lowercase letters, and a number.

### Template Customization
JSON files are used by the Azure Image Builder to create a template for the virtual machine. There are two JSON files inside of the repository. `basicVMTemplate.json` will create a Windows 10 computer with (figure out customizations), and `vmTemplate.json` will create a customized Windows 10 computer with the programs listed below. The latter can be further customized by the user with ease to support their needs.

In order to add, remove, or edit the scripts that are used to customize `vmTemplate.json`, the `customize` section of the file should be edited. It is under this section that scripts are used to customize the virtual machine. 

# List of Default Customization Scripts
* `pyInstall.sh`
    * Install python 3.7.0
* `anacondaDownload.ps1`
    * Install Anaconda3
* `anacondaInstall.sh`
    * Install Anaconda
* `changeMACAddress.sh`
    * Change MAC Adress of TAP Adapter
* `restartTapAdapter.ps1`
    * Disable and enable TAP Adapter to change MAC Address
* `downloadTAPAdapter.ps1`
    * Download TAP Adapter 9.23
* `downloadmuSTEM.ps1`
    * Download muSTEM files and expand them
* `installCUDAToolkit.ps1`
    * Donwload and install CUDAToolkit Version 9
* `installDrProbeGUI.ps1`
    * Download and install DrProbeGUI software
* `nionswift.sh`
    * Creates nionswift environment and installs packagees including EELS and Experimental plugins
* `rigidRegistrationDownload.ps1`
    * Download rigidRegistration files
* `rigidregistrationInstall.sh`
    * Install rigidRegistration


