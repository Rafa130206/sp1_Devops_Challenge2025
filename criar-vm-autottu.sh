# Variáveis
RG_NOME="rg-autottu"
LOCALIZACAO="brazilsouth"
VM_NOME="vm-autottu"

# Criar grupo de recursos
az group create --name $RG_NOME --location $LOCALIZACAO

# Criar maquina virtual
az vm create --resource-group $RG_NOME --name $VM_NOME --image almalinux:almalinux-x86_64:9-gen2:latest --size Standard_B1s --authentication-type password --admin-username autottuadm --admin-password Autottu@2025

# Abrir porta 80
az network nsg rule create --resource-group $RG_NOME --nsg-name vm-autottuNSG --name Allow-HTTP --priority 1001 --access Allow --protocol Tcp --direction Inbound --destination-port-range 80

# Abrir porta 8080
az network nsg rule create --resource-group $RG_NOME --nsg-name vm-autottuNSG --name Allow-8080 --priority 1002 --access Allow --protocol Tcp --direction Inbound --destination-port-range 8080

# Abrir porta 8081
az network nsg rule create --resource-group $RG_NOME --nsg-name vm-autottuNSG --name Allow-8081 --priority 1022 --access Allow --protocol "*" --direction Inbound --destination-port-range 8081

# Abrir porta 1521
az network nsg rule create --resource-group $RG_NOME --nsg-name vm-autottuNSG --name Allow-1521 --priority 1011 --access Allow --protocol "*" --direction Inbound --destination-port-range 1521
