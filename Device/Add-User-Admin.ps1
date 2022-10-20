Function AddMyAccountAdminLocal {
    Param (
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName
    )
    net localgroup "Administrators" /add "AzureAD\$UPN"

}


# Retrieve UPN
$SpecificUpn = Read-Host "Do you want to add specific user ? (Y/N)"
If ($SpecificUpn -eq "Y") {
    $UPN = Read-Host "UserPrincipalName/Email:"
} Else {
    $UPN = whoami /upn
}
Write-Host "UPN: $UPN" -ForegroundColor Yellow
# Add user in Administrators local group
AddMyAccountAdminLocal -UserPrincipalName $UPN

