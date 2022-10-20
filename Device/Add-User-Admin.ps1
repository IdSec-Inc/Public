[CmdletBinding()]
Param (
    [Switch]$SpecificUpn
  )

Function AddMyAccountAdminLocal {
    Param (
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName
    )
    net localgroup "Administrators" /add "AzureAD\$UPN"

}

# Retrieve UPN
If ($SpecificUpn) {
    $UPN = Read-Host "UserPrincipalName/Email:"
} Else {
    $UPN = whoami /upn
}

# Add user in Administrators local group
AddMyAccountAdminLocal -UserPrincpalName $UPN

