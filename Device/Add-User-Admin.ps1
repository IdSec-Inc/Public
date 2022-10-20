Function AddMyAccountAdminLocal {
    Param (
        [Switch]$SpecificUpn 
    )
    If ($SpecificUpn) {
        $UPN = Read-Host "UserPrincipalName/Email:"
    } Else {
        $UPN = whoami /upn
    }
    net localgroup "Administrators" /add "AzureAD\$UPN"

}

AddMyAccountAdminLocal

