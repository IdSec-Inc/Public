<# 
.SYNOPSIS
    This script is to identity the changes will be applied to the new environmenent.

.PARAMETER SourceFile
    File contains the source of MIM schema

.PARAMETER DestinationFile
    File contains the destination of MIM schema

.PARAMETER Type
    Define the type of MIM config which be imported

.EXAMPLE
    PS C:\> SyncConfig.ps1 -Type "Schema" -SourceFile "\2020-12-10_09-25\Source-Schema.xml" -DestinationFile "\2020-12-10_09-25\Destination-Schema.xml"

.EXAMPLE
    PS C:\> SyncConfig.ps1 -Type "Policy" -SourceFile "\2020-12-10_09-25\Source-Policy.xml" -DestinationFile "\2020-12-10_09-25\Destination-Policy.xml"

# Based on this script https://docs.microsoft.com/en-us/previous-versions/mim/ff400277(v=ws.10)?redirectedfrom=MSDN
#>

Param (
    [Parameter(Mandatory = $false)][string]$SourceFile,
    [Parameter(Mandatory = $false)][string]$DestinationFile,
    [Parameter(Mandatory = $false)][ValidateSet("Schema","Policy")][string]$Type
)

$Path = (Get-Location).Path
$Changes_filename = "Changes-$Type.xml"
$joinrules = @{
    # === Customer-dependent join rules ===
    # Person and Group objects are not configuration will not be migrated.
    # However, some configuration objects like Sets may refer to these objects.
    # For this reason, we need to know how to join Person objects between
    # systems so that configuration objects have the same semantic meaning.
    Person = "DisplayName";
    Group = "DisplayName";
    # === Policy configuration ===
    # Sets, MPRs, Workflow Definitions, and so on. are best identified by DisplayName
    # DisplayName is set as the default join criteria and applied to all object
    # types not listed here.
    # === Schema configuration ===
    # This is based on the system names of attributes and objects
    # Notice that BindingDescription is joined using its reference attributes.
    ObjectTypeDescription = "Name";
    AttributeTypeDescription = "Name";
    BindingDescription = "BoundObjectType BoundAttributeType";
    # === Portal configuration ===
    ConstantSpecifier = "BoundObjectType BoundAttributeType ConstantValueKey";
    SearchScopeConfiguration = "DisplayName SearchScopeResultObjectType Order";
    ObjectVisualizationConfiguration = "DisplayName AppliesToCreate AppliesToEdit AppliesToView"
}

If(@(Get-PSsnapin | where-object {$_.Name -eq "FIMAutomation"} ).count -eq 0) {
    Add-PSsnapin FIMAutomation
}

Write-Host "Loading production file " $Path\$SourceFile "."
$Source = ConvertTo-FIMResource -file $Path\$SourceFile
if($Source -eq $null)
{
    throw (new-object NullReferenceException -ArgumentList "Production Schema is null.  Check that the production file has data.")
}

Write-Host "Loaded file " $SourceFile "." $Source.Count " objects loaded."

Write-Host "Loading pilot file " $Path\$DestinationFile "."
$Destination = ConvertTo-FIMResource -file $Path\$DestinationFile
if($Destination -eq $null)
{
    throw (new-object NullReferenceException -ArgumentList "Pilot Schema is null.  Check that the pilot file has data.")
}

Write-Host "Loaded file " $DestinationFile "." $Destination.Count " objects loaded."
Write-Host
Write-Host "Executing join between pilot and production."
Write-Host 
$matches = Join-FIMConfig -source $Source -target $Destination -join $joinrules -defaultJoin DisplayName
if($matches -eq $null)
{
    throw (new-object NullReferenceException -ArgumentList "Matches is null.  Check that the join succeeded and join criteria is correct for your environment.")
}
Write-Host "Executing compare between matched objects in pilot and production."
$changes = $matches | Compare-FIMConfig
if($changes -eq $null)
{
    throw (new-object NullReferenceException -ArgumentList "Changes is null.  Check that no errors occurred while generating changes.")
}
Write-Host "Identified " $changes.Count " changes to apply to production."
Write-Host "Saving changes to " $changes_filename "."
$changes | ConvertFrom-FIMResource -file "$Path\$changes_filename"
Write-Host
Write-Host "Sync complete. The next step is to commit the changes using CommitChanges.ps1."