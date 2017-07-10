######################################################################
# Created By @RicardoConzatti | September 2016
# www.Solutions4Crowds.com.br
######################################################################
# Add snapin on PowerShell
Add-PSSnapin VMware.VimAutomation.Core

# Config vCenter Server
$vCenter="IP or FQDN"
$vCadmin="administrator@vsphere.local"
$vCpass="Your$4cureP@ss"

# Variables - Options
$SourceVMName="Windows Server 2012 R2 - LC"
$SourceVMSnapshotName="Linked Clone Master"
$NewVMName="NEW-VM"
$vCenterFolderName="RICARDO"
$vCenterResourcePoolName="RICARDO"
$DatastoreName="CPT-LAB-DS-009"
$ESXiName="dc-vhost6.discovery.local"
$Customization="_Sysprep Default"

# Connect vCenter Server
Connect-VIServer $vCenter -u $vCadmin -password $vCpass

# Script New-VM
New-VM -Name $NewVMName -VM $SourceVMName -Location $vCenterFolderName -Datastore $DatastoreName -ResourcePool $vCenterResourcePoolName -VMHost $ESXiName -LinkedClone -ReferenceSnapshot $SourceVMSnapshotName -OSCustomizationSpec $Customization