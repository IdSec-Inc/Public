
Read-Host "UPN of the user"
$Member = "AzureAD\"+$UPN
try {
    Add-LocalGroupMember -Group "Administrators" -Member $Member
}
catch {
    {Write-Host "Something happends" -Foregroundcolor Red}

}