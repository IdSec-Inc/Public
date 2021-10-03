<# 
.SYNOPSIS
    This script import the changes to the new environmenent.

.PARAMETER Type
    Define the type of MIM config which be imported

.PARAMETER Uri
    Destination URI of MIM

.PARAMETER Undone
    If specified, the config file named Undone-Schema.xml will be import

.EXAMPLE
    PS C:\> CommitChanges.ps1 -Type "Schema" -Uri "http://servername:5725"

.EXAMPLE
    PS C:\> CommitChanges.ps1 -Type "policy" -Uri "http://servername:5725"

.EXAMPLE
    PS C:\> CommitChanges.ps1 -Type "policy" -undone -Uri "http://servername:5725"

# Based on this script https://docs.microsoft.com/en-us/previous-versions/mim/ff400277(v=ws.10)?redirectedfrom=MSDN
#>
Param (
    [Parameter(Mandatory = $false)][string]$Uri,
    [Parameter(Mandatory = $false)][ValidateSet("Schema","Policy")][string]$Type,
    [Switch]$undone
)

$Path = (Get-Location).Path
$changes_filename = "Changes-$Type.xml"
$undone_filename = "Undone-$Type.xml"

If ($Undone) {
  $imports = ConvertTo-FIMResource -file "$Path\$undone_filename"
  Write-Host "undone"
} else {
  $imports = ConvertTo-FIMResource -file "$Path\$changes_filename"
  Write-Host "changes"
}

If ($imports -eq $null) {
    throw (new-object NullReferenceException -ArgumentList "Changes is null.  Check that the changes file has data.")
  }
Write-Host "Importing changes into production."
$undoneImports = $imports | Import-FIMConfig -Uri $Uri
If ($undoneImports -eq $null) {
    Write-Host "Import complete."
} else {
    Write-Host
    Write-Host "There were " $undoneImports.Count " uncompleted imports."
    $undoneImports | ConvertFrom-FIMResource -file "$Path\$undone_filename"
    Write-Host
    Write-Host "Please see the documentation on how to resolve the issues."
}
