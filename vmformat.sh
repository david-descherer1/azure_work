#script for formatting vm builder json
#this needs to be customized>

# Resource Group Name
imageResourceGroup=<imageResourceGroup>
# Region location 
location=<location>
# Name for the image 
imageName=<imageName>
# Run output name
runOutputName=<runOutputName>
# name of the image to be created
imageName=<different from image name>

subscriptionID=$(az account show --query id --output tsv)

az group create -n $imageResourceGroup -l $location

az identity create -g $imageResourceGroup -n <myUserAssignedIdentity>
