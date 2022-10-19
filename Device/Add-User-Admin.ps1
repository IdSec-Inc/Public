
Read-Host "UPN of the user:"
Add-LocalGroupMember -Group "Administrators" -Member "AzureAD\$UPN"