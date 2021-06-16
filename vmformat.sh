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

identityName=aibBuiUserId$(date +'%s')
az identity create -g $imageResourceGroup -n $identityName

imgBuilderCliId=$(az identity show -g $imageResourceGroup -n $identityName | grep "clientId" | cut -c16- | tr -d '",')

imgBuilderId=/subscriptions/$subscriptionID/resourcegroups/$imageResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$identityName

curl https://raw.githubusercontent.com/azure/azvmimagebuilder/master/solutions/12_Creating_AIB_Security_Roles/aibRoleImageCreation.json -o aibRoleImageCreation.json

imageRoleDefName="Azure Image Builder Image Def"$(date +'%s')

sed -i -e "s/<subscriptionID>/$subscriptionID/g" aibRoleImageCreation.json
sed -i -e "s/<rgName>/$imageResourceGroup/g" aibRoleImageCreation.json
sed -i -e "s/Azure Image Builder Service Image Creation Role/$imageRoleDefName/g" aibRoleImageCreation.json

# create role definitions
az role definition create --role-definition ./aibRoleImageCreation.json

az role assignment create \
    --assignee $imgBuilderCliId \
    --role Contributor \
    --scope /subscriptions/$subscriptionID/resourceGroups/$imageResourceGroup

curl https://raw.githubusercontent.com/david-descherer1/azure_work/master/basicVMTemplate.json -o basicVMTemplate.json

sed -i -e "s/<subscriptionID>/$subscriptionID/g" basicVMTemplate.json
sed -i -e "s/<rgName>/$imageResourceGroup/g" basicVMTemplate.json
sed -i -e "s/<region>/$location/g" basicVMTemplate.json
sed -i -e "s/<imageName>/$imageName/g" basicVMTemplate.json
sed -i -e "s/<runOutputName>/$runOutputName/g" basicVMTemplate.json
sed -i -e "s%<imgBuilderId>%$imgBuilderId%g" basicVMTemplate.json


