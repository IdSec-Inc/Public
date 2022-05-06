<#
.SYNOPSIS
    The script lists ACL on a specific OU for a specific account 

.DESCRIPTION


.EXAMPLE


.NOTES

#>
param (
    [Parameter(Mandatory=$true)]$Domain,
    [Parameter(Mandatory=$true)]$OrganizationalUnit,
    [Parameter(Mandatory=$false)]$Account
)

$schemaIDGUID = @{}
Get-ADObject -SearchBase (Get-ADRootDSE).schemaNamingContext -LDAPFilter '(schemaIDGUID=*)' -Properties name, schemaIDGUID | ForEach-Object {$schemaIDGUID.add([System.GUID]$_.schemaIDGUID,$_.name)}
Get-ADObject -SearchBase "CN=Extended-Rights,$((Get-ADRootDSE).configurationNamingContext)" -LDAPFilter '(objectClass=controlAccessRight)' -Properties name, rightsGUID | ForEach-Object {$schemaIDGUID.add([System.GUID]$_.rightsGUID,$_.name)}


$FQDN = (Get-ADDomain $Domain).DNSRoot
$DC = (Get-ADDomain $Domain).InfrastructureMaster

$Location = $Domain +":"
# $Cred = Get-Credential -Credential "$FQDN\"
New-PSDrive -Name $Domain -PSProvider ActiveDirectory -Server $DC -scope Global -root "//rootDSE/" # -Credential $Cred
Set-location $Location

$OUs = (Get-ADOrganizationalUnit -Filter 'Name -eq $OrganizationalUnit' -Server $DC)
If ($OUs.Count -ge 2) {
    ForEach ($OU in $OUs){
        Write-Host $OU
    }
    $Menu = @{}
    For ($i=1;$i -le $OUs.Count;$i++){
        $Menu.Add($i,($OUs[$i-1].DistinguishedName))
    }
    [int]$Number = Read-Host 'Enter your selection'
    $Selection = $Menu.Item($Number)
    (Get-ACL $Selection).access
}Else{
    Write-Host "One OU" -ForegroundColor Green
    # $ACLs = (Get-ACL (Get-ADOrganizationalUnit -Filter 'Name -eq $OrganizationalUnit').DistinguishedName | Where-Object $_.IdentityReference -like $Account).access
    $ACLs = (Get-ACL (Get-ADOrganizationalUnit -Filter 'Name -eq $OrganizationalUnit').DistinguishedName | Where-Object $_.AccessToString -match $Account)
    $ACLs.Count
    $ACLs
}

Set-Location C:
Remove-PSDrive $Domain