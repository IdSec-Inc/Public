<# 
.SYNOPSIS
    Extract OU synced.

.EXAMPLE
    PS C:\> List-Synced-OU.ps1 > OUs.log

#>

Get-ADSyncConnector | Where-Object { $_.Type -eq "AD" } | ForEach-Object {
    $i = $_
    Write-Output "Forest: $($i.Name)"
    $Domain
    $i.Partitions | ForEach-Object {

 

        Write-Output "`tParition: $($_.Name)"
        $_.ConnectorPartitionScope | ForEach-Object {
            $_.ContainerInclusionList | ForEach-Object {
                Write-Output "`t`t$($_)"
            }
        }
    }
    "---"
}