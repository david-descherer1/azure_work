#!/bin/bash
#script for formatting vm builder json
#this needs to be customized>

source config.cfg

# Resource Group Name 
#imageResourceGroup=<imageResourceGroup>
# Region location 
#location=<location>
# Name for the image to be created - what it will be called in azure portal
#imageName=<imageName>
# Run output name - (whats the point)
#runOutputName=<runOutputName>

#Gets users Azure subscription ID
subscriptionID=$(az account show --query id --output tsv)

#Creates Resource Group (not needed if using already made resource group)
az group create -n $imageResourceGroup -l $location

#generate and assign unique identity name (can be replaced)
identityName=aibBuiUserId$(date +'%s')

#creates managed identity in given resource group with identity name
az identity create -g $imageResourceGroup -n $identityName

#fetch ClientID of given managed identity
imgBuilderCliId=$(az identity show -g $imageResourceGroup -n $identityName | grep "clientId" | cut -c16- | tr -d '",')

#creates user identity URI that will be transposed to VMTemplate JSON file
imgBuilderId=/subscriptions/$subscriptionID/resourcegroups/$imageResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$identityName

#download role definition template
curl https://raw.githubusercontent.com/azure/azvmimagebuilder/master/solutions/12_Creating_AIB_Security_Roles/aibRoleImageCreation.json -o aibRoleImageCreation.json

#(still not sure point of this)
imageRoleDefName="Azure Image Builder Image Def"$(date +'%s')

#edit role definition template
sed -i -e "s/<subscriptionID>/$subscriptionID/g" aibRoleImageCreation.json
sed -i -e "s/<rgName>/$imageResourceGroup/g" aibRoleImageCreation.json
sed -i -e "s/Azure Image Builder Service Image Creation Role/$imageRoleDefName/g" aibRoleImageCreation.json

# create role definitions - role definitions give permissions like reading and writingto the image builder on your subscription and resource group
az role definition create --role-definition ./aibRoleImageCreation.json

#Gives created permissions to managed identity with given Client ID
az role assignment create \
    --assignee $imgBuilderCliId \
    --role Contributor \
    --scope /subscriptions/$subscriptionID/resourceGroups/$imageResourceGroup


#download VMTemplate
curl https://raw.githubusercontent.com/david-descherer1/azure_work/master/basicVMTemplate.json -o basicVMTemplate.json

#Customize Template
sed -i -e "s/<subscriptionID>/$subscriptionID/g" basicVMTemplate.json
sed -i -e "s/<rgName>/$imageResourceGroup/g" basicVMTemplate.json
sed -i -e "s/<region>/$location/g" basicVMTemplate.json
sed -i -e "s/<imageName>/$imageName/g" basicVMTemplate.json
sed -i -e "s/<runOutputName>/$runOutputName/g" basicVMTemplate.json
sed -i -e "s%<imgBuilderId>%$imgBuilderId%g" basicVMTemplate.json

#Create Image Template from VMTemplate
#n - name of image template (could make this a variable)
az resource create \
    --resource-group $imageResourceGroup \
    --properties @basicVMTemplate.json \
    --is-full-object \
    --resource-type Microsoft.VirtualMachineImages/imageTemplates \
    -n $imageTemplateName

#Builds the image template to an image
az resource invoke-action \
     --resource-group $imageResourceGroup \
     --resource-type  Microsoft.VirtualMachineImages/imageTemplates \
     -n $imageTemplateName \
     --action Run 


#az vm create - creates virtual machine and associated resources
#resource-group identifies the resource group the vm will be made in
#name - creates name of virtual machine
#admin-username/password - username/password for logging into vm
#image - 
#location - identifies the location for the vm to be created in
az vm create \
  --resource-group $imageResourceGroup \
  --name $vmName \
  --admin-username $admin_username \
  --admin-password $admin_password \
  --image $imageName \
  --location $location
#VM should be created in personal Azure Portal

