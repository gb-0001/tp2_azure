#!/bin/bash

RESSOURCEGRPNAME="tp2-gerald"
LOCATION="ukwest"
CIDR="10.77.0.0/16"
SUBNETPUB="10.77.87.0/24"
VMNAME="tp2gbvm"
DNSNAME="tp2gb"
TPL="azdeploy.json"

#RAZ trace.log
echo "" > trace.log


# Creation groupe ressources
echo "---- creation groupe ressources -----" 1>>trace.log 2>&1
if [ $(az group exists --name $RESSOURCEGRPNAME) = false ]; then
    az group create --name $RESSOURCEGRPNAME --location $LOCATION 1>>trace.log 2>&1
fi
echo "" 1>>trace.log 2>&1




#deploiment tpl
az deployment group create \
  --Name dpltp2gb \
  --adminPasswordOrKey
  --resource-group $RESSOURCEGRPNAME \
  --template-file $TPL \
  --parameters vmName=$VMNAME sshPublicKey=C:\Users\ib\.ssh\id_rsa