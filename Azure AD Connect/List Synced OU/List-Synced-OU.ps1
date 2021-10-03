<# 
.SYNOPSIS
Extract OU synced

.DESCRIPTION
Extract the Organizational Unit synced with Active Directory

.EXAMPLE
PS C:\> List-Synced-OU.ps1 > OUs.log

.NOTES
Created by Mathias DUMONT

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