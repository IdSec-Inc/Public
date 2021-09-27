<# 
.SYNOPSIS
    Export the current schema and policy configurations.

.PARAMETER SourceUri
    Source URI of MIM

.PARAMETER DestinationUri
    Destination URI of MIM

.EXAMPLE
    PS C:\> Export-Config.ps1 -SourceUri 'http://servername:5725'

.EXAMPLE
    PS C:\> Export-Config.ps1 -SourceUri 'http://servername:5725' -DestinationUri 'http://servername:5725'

# Based on this script https://docs.microsoft.com/en-us/previous-versions/mim/ff400277(v=ws.10)?redirectedfrom=MSDN
#>
Param (
    [Parameter(Mandatory = $false)][string]$SourceUri,
    [Parameter(Mandatory = $false)][string]$DestinationUri
)

Function Export {
    Param (
        [Parameter(Mandatory = $true)][string]$SchemaFile,
        [Parameter(Mandatory = $true)][string]$PolicyFile,
        [Parameter(Mandatory = $true)][string]$Uri,
        [Parameter(Mandatory = $true)][string]$From
    )
    Write-Host "Exporting configuration objects from pilot."
    $Schema = Export-FIMConfig -schemaConfig -customConfig "/SynchronizationFilter" -Uri $Uri
    If ($Schema -eq $null) {
        Write-Host "Export did not successfully retrieve configuration from FIM.  Please review any error messages and ensure that the arguments to Export-FIMConfig are correct."
    } else {
        Write-Host "Exported " $Schema.Count " objects from $From."
        $Schema | ConvertFrom-FIMResource -file $SchemaFile
        Write-Host "$From file is saved as " $SchemaFile "."
        If($Schema.Count -gt 0) {
            Write-Host "Export complete."
        } Else {
            Write-Host "While export completed, there were no resources.  Please ensure that the arguments to Export-FIMConfig are correct." 
        }
    }
    $policy = Export-FIMConfig -policyConfig -portalConfig -MessageSize 9999999 -Uri $Uri
    If ($policy -eq $null) {
        Write-Host "Export did not successfully retrieve configuration from FIM.  Please review any error messages and ensure that the arguments to Export-FIMConfig are correct."
    } Else {
        Write-Host "Exported " $policy.Count " objects from $From."
        $policy | ConvertFrom-FIMResource -file $PolicyFile
        Write-Host "$From file is saved as " $PolicyFile "."
        If($policy.Count -gt 0) {
            Write-Host "Export complete.  The next step is run SyncSchema.ps1."
        } Else {
            Write-Host "While export completed, there were no resources.  Please ensure that the arguments to Export-FIMConfig are correct."
        }
    }
}

If(@(get-pssnapin | where-object {$_.Name -eq "FIMAutomation"} ).count -eq 0) {
    Add-PSsnapin FIMAutomation
}

$Path = (Get-Location).Path
$Date = Get-date -format yyyy-MM-dd_hh-mm
$Folder = "$Path\$date"

If(!(Test-Path -Path $Folder )){
    New-Item -ItemType directory -Path $Folder | Out-Null
} Else {
    # Write-Host "Folder already exists"
}

If ($SourceUri) {
    $From = "Source"
    $SchemaFileName = "$Folder\$From-Schema.xml"
    $PolicyFileName = "$Folder\$From-Policy.xml"
    Export -SchemaFile $SchemaFileName -PolicyFile $PolicyFileName -Uri $SourceUri -From $From
}
If ($DestinationUri) {
    $From = "Destination"
    $SchemaFileName = "$Folder\$From-Schema.xml"
    $PolicyFileName = "$Folder\$From-Policy.xml"
    Export -SchemaFile $SchemaFileName -PolicyFile $PolicyFileName -Uri $DestinationUri -From $From
}
If ((!($SourceUri)) -and (!($DestinationUri))) {
    Write-Host "No URI specified !!"
}

