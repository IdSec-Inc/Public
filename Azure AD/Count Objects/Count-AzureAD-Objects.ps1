<#

.SYNOPSIS
Count objetcs in Azure AD

.DESCRIPTION
This script count (approximately) the number of objects in AzureAD

.EXAMPLE
PS :\> Count-AzureAD-Objects.ps1 -CurrentCredential
Use the current credential

.EXAMPLE
PS :\> Count-AzureAD-Objects.ps1
A prompt will be appear

.NOTES
Created by Mathias DUMONT - @IdSec Inc and Pierre - Microsoft

#### Script Version ####
# 24/03/2020 - Rev0.1 - Script creation
#>
Param(
    [Switch]$CurrentCredential
)

If ($CurrentCredential){
    Connect-AzureAD -AccountId $(whoami /UPN)
} else {
    Connect-AzureAD -Credential (Get-Credential)
}

Write-Host "User objects" -ForegroundColor Yellow
$users = (Get-AzureADUser -All:$true).Count
Write-Host "Group objects" -ForegroundColor Yellow
$groups = (Get-AzureADGroup -All:$true).Count
Write-Host "Contact objects" -ForegroundColor Yellow
$contacts = (Get-AzureADContact -All:$true).Count
Write-Host "Device objects" -ForegroundColor Yellow
$devices = (Get-AzureADDevice -All:$true).Count
Write-Host "Application objects" -ForegroundColor Yellow
$applications = (Get-AzureADApplication -All:$true).Count
Write-Host "Deleted Application objects" -ForegroundColor Yellow
$deletedapplications = (Get-AzureADDeletedApplication).Count
Write-Host "Service Principal objects" -ForegroundColor Yellow
$serviceprincipals= (Get-AzureADServicePrincipal -All:$true).Count
Write-Host "Contract objects" -ForegroundColor Yellow
$contracts = (Get-AzureADContract -All:$true).Count
Write-Host "Role objects" -ForegroundColor Yellow
$roles = (Get-AzureADDirectoryRole).Count
Write-Host "Extension Properties objects" -ForegroundColor Yellow
$extensionproperties = (Get-AzureADExtensionProperty).Count
Write-Host "App Proxy Connectors objects" -ForegroundColor Yellow
$applicationproxyconnectors = (Get-AzureADApplicationProxyConnector).Count

New-Object -TypeName psobject -Property @{
    Users = $users
    Groups = $groups
    Contacts = $contacts
    Devices = $devices
    Applications = $applications
    DeletedApplications = $deletedapplications
    ServicePrincipals = $serviceprincipals
    Contracts = $contracts
    Roles = $roles
    ExtensionProperties = $extensionproperties
    ApplicationProxyConnectors = $applicationproxyconnectors
}

$Total = $users + $groups + $contacts + $devices + $applications + $deletedapplications + $serviceprincipals +$contacts + $roles + $extensionproperties + $applicationproxyconnectors
Write-Host "Total : $Total" -ForegroundColor Yellow