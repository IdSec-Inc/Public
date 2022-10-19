<<<<<<< HEAD
param (
    [Parameter(Mandatory=$false)]$Domain,
    [Parameter(Mandatory=$False)]$OrganizationalUnit,
    [Parameter(Mandatory=$True)]$Account,
    [Parameter(Mandatory=$True)][ValidateSet("Group","User","Computer","GPO","OrganizationaUnit","Container","Builtin")]$ObjectType,
    [Parameter(Mandatory=$True)][ValidateSet("Sysadmin","ActiveDirectory")]$Team
)
#################################
# Source Schema-ID-GUID : https://docs.microsoft.com/en-us/windows/win32/adschema/c-computer
#################################
Function ACEObjectType ($ObjectType) {
    $ReturnACEObjTypeTable = [Ordered]@{}
    Switch ($ObjectType) {
        "User"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967aba-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        } 
        "Computer"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967a86-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
        "Group"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967a9c-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
        "GPO"{$GUID = 'f30e3bc2-9ff0-11d1-b603-0000f80367c1'} # Group Policy Container
        "OrganizationalUnit"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967aa5-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
       "Container"{$GUID = 'bf967a8b-0de6-11d0-a285-00aa003049e2'} # Container
        "Builtin"{$GUID = 'bf967a81-0de6-11d0-a285-00aa003049e2'} # Builtin-Domain
        Default {Write-Host "ObjectType not found" -ForegroundColor Magenta}
    }
    Return $ReturnACEObjectType
}
Function ACEObject ($ObjectType) {
    $ReturnACEObjTable = [Ordered]@{}
    Switch ($ObjectType) {
       "User"{# User
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967aba-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        } 
        "Computer"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967a86-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "Group"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967a9c-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "GPO"{$GUID = 'f30e3bc2-9ff0-11d1-b603-0000f80367c1'} # Group Policy Container
        "OrganizationalUnit"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967aa5-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "Container"{$GUID = 'bf967a8b-0de6-11d0-a285-00aa003049e2'} # Container
        "Builtin"{$GUID = 'bf967a81-0de6-11d0-a285-00aa003049e2'} # Builtin-Domain
        Default {Write-Host "ObjectType not found" -ForegroundColor Magenta}
    }
    Return $ReturnACEObject
}
###################
# Start
$Continue = $True
Write-Host "Start" -ForegroundColor Green
# PSDrive
$DC = (Get-ADDomain $Domain).InfrastructureMaster
$DomainDN = (Get-ADDomain $Domain).DistinguishedName
$Location = $Domain +":"
$Cred = Get-Credential -Credential "$Domain\"
New-PSDrive -Name $Domain -PSProvider ActiveDirectory -Server $DC -scope Global -root "//rootDSE/" -Credential $Cred

# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Set Organizational Unit
# $OU = "OU=ACL,OU=DEV,DC=res,DC=bngf,DC=local"
$OU = $OrganizationalUnit+","+$DomainDN
$Path = $Domain+":\"+$OU
Write-Host "Path : $Path" -ForegroundColor Yellow
Try {
    Get-ACL -Path $Path -ErrorAction stop | Out-Null
}
Catch [Microsoft.ActiveDirectory.Management.ADReferralException] {
    $Continue = $False
    Write-Host "OU not found" -ForegroundColor Magenta
    Break
}
If ($Continue -eq $True) {
    $Identity = [System.Security.Principal.IdentityReference] $SID
    # Retrieve ACLs
    $objACL = Get-ACL -Path $Path
    # ---------
    # Read XML
    $Xml = [Xml](Get-Content ".\Config.xml")
    $Xml.Teams.Team | Where {$_.Name -eq "AAP"} | ForEach {
        $TeamName = $_.Name
        Write-Host "Team : $TeamName" -ForegroundColor Yellow
        # Objects
        $_.Object | ForEach {
            $Group = $_.ADGroup.Name
            $Object = $_.Name
            Write-Host "  Group : $Group" -ForegroundColor Green
            Write-Host "  Object : $Object" -ForegroundColor Green
            Write-Host "  ObjectType : $ObjectType" -ForegroundColor Green
            If ($ObjectType -eq $Object) {
                # Rights
                $_.Rights | ForEach {
                    $Rights = $_.Name
                    Write-Host "    Right : $Rights" -ForegroundColor Magenta
                    $ReturnACEObjTypeTable = $null
                    $ReturnACEObjTable = $null
                    $ReturnACEObjTypeTable = [Ordered]@{}
                    $ReturnACEObjTable = [Ordered]@{}
                    If ($Rights="objectType"){
                        # Right
                        $_.Right | ForEach {
                            $Right = $_.Name
                            $Value = $_.Value
                            $Type = $_.Type
                            Write-Host "      Right : $Type / $Right / $Value" -ForegroundColor Gray
                            Switch ($Right){
                                "ADRights"{[System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = $Value}
                                "AccessControlType"{[System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = $Value}
                                "ObjectType"{[GUID]$ReturnACEObjTypeTable.ObjectType = $Value}
                                "InheritanceType"{[System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = $Value}
                                "InheritedObjectType"{[GUID]$ReturnACEObjTypeTable.InheritedObjectType = $Value}
                            }
                        }
                    } elseif ($Rights="object") {
                        # Right
                        $_.Right | ForEach {
                            $Right = $_.Name
                            $Value = $_.Value
                            $Type = $_.Type
                            Write-Host "      Right : $Type / $Right / $Value" -ForegroundColor Gray
                            Switch ($Right){
                                "ADRights"{[System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = $Value}
                                "AccessControlType"{[System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = $Value}
                                "ObjectType"{[GUID]$ReturnACEObjTable.ObjectType = $Value}
                                "InheritanceType"{[System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = $Value}
                                "InheritedObjectType"{[GUID]$ReturnACEObjTable.InheritedObjectType = $Value}
                            }
                        }
                    } Else {
                    }
                    "---- ObjectType ----"
                    $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
                    $ReturnACEObjectType
                    "---- Object ----"
                    $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
                    $ReturnACEObject
                }
            }
            # ---------
            # Set ACL for Object Type
            $ReturnACEObjectType = ACEObjectType $ObjectType
            $objACEObjType = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
                $ReturnACEObjectType.ADRights,`
                $ReturnACEObjectType.AccessControlType,`
                $ReturnACEObjectType.ObjectType,`
                $ReturnACEObjectType.InheritanceType,`
                $ReturnACEObjectType.InheritedObjectType
            $objACEObjType
            $objACL.AddAccessRule($objACEObjType)
            Try {
                # Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
            }
            Catch [Microsoft.ActiveDirectory.Management.ADException]{
                Write-Host "Access denied" -ForegroundColor Magenta
            }
            Catch {
                Write-Host "Something else bad request" -ForegroundColor Magenta
            }
        }
    }


}


<#
# PSDrive
$DC = (Get-ADDomain $Domain).InfrastructureMaster
$DomainDN = (Get-ADDomain $Domain).DistinguishedName
$Location = $Domain +":"
$Cred = Get-Credential -Credential "$Domain\"
New-PSDrive -Name $Domain -PSProvider ActiveDirectory -Server $DC -scope Global -root "//rootDSE/" -Credential $Cred

# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Set Organizational Unit
# $OU = "OU=ACL,OU=DEV,DC=res,DC=bngf,DC=local"
$OU = $OrganizationalUnit+","+$DomainDN
$Path = $Domain+":\"+$OU
Write-Host "Path : $Path" -ForegroundColor Yellow
Try {
    Get-ACL -Path $Path -ErrorAction stop | Out-Null
}
Catch [Microsoft.ActiveDirectory.Management.ADReferralException] {
    $Continue = $False
    Write-Host "OU not found" -ForegroundColor Magenta
    Break
}
Catch {
    $Continue = $False
    Write-Host "Something else bad request" -ForegroundColor Magenta
    Break
}

If ($Continue -eq $True) {
    $Identity = [System.Security.Principal.IdentityReference] $SID
    # Retrieve ACLs
    $objACL = Get-ACL -Path $Path
    # Set ACL for Object Type
    $ReturnACEObjectType = ACEObjectType $ObjectType
    $objACEObjType = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
        $ReturnACEObjectType.ADRights,`
        $ReturnACEObjectType.AccessControlType,`
        $ReturnACEObjectType.ObjectType,`
        $ReturnACEObjectType.InheritanceType,`
        $ReturnACEObjectType.InheritedObjectType
    $objACEObjType
    $objACL.AddAccessRule($objACEObjType)
    Try {
        Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
    }
    Catch [Microsoft.ActiveDirectory.Management.ADException]{
        Write-Host "Access denied" -ForegroundColor Magenta
    }
    Catch {
        Write-Host "Something else bad request" -ForegroundColor Magenta
    }

    
    # Set ACL for Object
    $ReturnACEObject = ACEObject $ObjectType
    $objACEObj = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
        $ReturnACEObject.ADRights,`
        $ReturnACEObject.AccessControlType,`
        $ReturnACEObject.ObjectType,`
        $ReturnACEObject.InheritanceType,`
        $ReturnACEObject.InheritedObjectType
    $objACEObj
    $objACL.AddAccessRule($objACEObj)
    Try {
        Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
    }
    Catch [Microsoft.ActiveDirectory.Management.ADException]{
        Write-Host "Access denied" -ForegroundColor Magenta
    }
    Catch {
        Write-Host "Something else bad request" -ForegroundColor Magenta
    }
    
}
Set-Location C:
Remove-PSDrive $Domain
#>
=======
param (
    [Parameter(Mandatory=$false)]$Domain,
    [Parameter(Mandatory=$False)]$OrganizationalUnit,
    [Parameter(Mandatory=$True)]$Account,
    [Parameter(Mandatory=$True)][ValidateSet("Group","User","Computer","GPO","OrganizationaUnit","Container","Builtin")]$ObjectType,
    [Parameter(Mandatory=$True)][ValidateSet("Sysadmin","ActiveDirectory")]$Team
)
#################################
# Source Schema-ID-GUID : https://docs.microsoft.com/en-us/windows/win32/adschema/c-computer
#################################
Function ACEObjectType ($ObjectType) {
    $ReturnACEObjTypeTable = [Ordered]@{}
    Switch ($ObjectType) {
        "User"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967aba-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        } 
        "Computer"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967a86-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
        "Group"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967a9c-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
        "GPO"{$GUID = 'f30e3bc2-9ff0-11d1-b603-0000f80367c1'} # Group Policy Container
        "OrganizationalUnit"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = "CreateChild,DeleteChild"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTypeTable.ObjectType = 'bf967aa5-0de6-11d0-a285-00aa003049e2'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = "All"
            [GUID]$ReturnACEObjTypeTable.InheritedObjectType = '00000000-0000-0000-0000-000000000000'
            $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
        }
       "Container"{$GUID = 'bf967a8b-0de6-11d0-a285-00aa003049e2'} # Container
        "Builtin"{$GUID = 'bf967a81-0de6-11d0-a285-00aa003049e2'} # Builtin-Domain
        Default {Write-Host "ObjectType not found" -ForegroundColor Magenta}
    }
    Return $ReturnACEObjectType
}
Function ACEObject ($ObjectType) {
    $ReturnACEObjTable = [Ordered]@{}
    Switch ($ObjectType) {
       "User"{# User
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967aba-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        } 
        "Computer"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967a86-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "Group"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967a9c-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "GPO"{$GUID = 'f30e3bc2-9ff0-11d1-b603-0000f80367c1'} # Group Policy Container
        "OrganizationalUnit"{
            [System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = "GenericAll"
            [System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = "Allow"
            [GUID]$ReturnACEObjTable.ObjectType = '00000000-0000-0000-0000-000000000000'
            [System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = "Descendents"
            [GUID]$ReturnACEObjTable.InheritedObjectType = 'bf967aa5-0de6-11d0-a285-00aa003049e2'
            $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
        }
        "Container"{$GUID = 'bf967a8b-0de6-11d0-a285-00aa003049e2'} # Container
        "Builtin"{$GUID = 'bf967a81-0de6-11d0-a285-00aa003049e2'} # Builtin-Domain
        Default {Write-Host "ObjectType not found" -ForegroundColor Magenta}
    }
    Return $ReturnACEObject
}
###################
# Start
$Continue = $True
Write-Host "Start" -ForegroundColor Green
# PSDrive
$DC = (Get-ADDomain $Domain).InfrastructureMaster
$DomainDN = (Get-ADDomain $Domain).DistinguishedName
$Location = $Domain +":"
$Cred = Get-Credential -Credential "$Domain\"
New-PSDrive -Name $Domain -PSProvider ActiveDirectory -Server $DC -scope Global -root "//rootDSE/" -Credential $Cred

# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Set Organizational Unit
# $OU = "OU=ACL,OU=DEV,DC=res,DC=bngf,DC=local"
$OU = $OrganizationalUnit+","+$DomainDN
$Path = $Domain+":\"+$OU
Write-Host "Path : $Path" -ForegroundColor Yellow
Try {
    Get-ACL -Path $Path -ErrorAction stop | Out-Null
}
Catch [Microsoft.ActiveDirectory.Management.ADReferralException] {
    $Continue = $False
    Write-Host "OU not found" -ForegroundColor Magenta
    Break
}
If ($Continue -eq $True) {
    $Identity = [System.Security.Principal.IdentityReference] $SID
    # Retrieve ACLs
    $objACL = Get-ACL -Path $Path
    # ---------
    # Read XML
    $Xml = [Xml](Get-Content ".\Config.xml")
    $Xml.Teams.Team | Where {$_.Name -eq "AAP"} | ForEach {
        $TeamName = $_.Name
        Write-Host "Team : $TeamName" -ForegroundColor Yellow
        # Objects
        $_.Object | ForEach {
            $Group = $_.ADGroup.Name
            $Object = $_.Name
            Write-Host "  Group : $Group" -ForegroundColor Green
            Write-Host "  Object : $Object" -ForegroundColor Green
            Write-Host "  ObjectType : $ObjectType" -ForegroundColor Green
            If ($ObjectType -eq $Object) {
                # Rights
                $_.Rights | ForEach {
                    $Rights = $_.Name
                    Write-Host "    Right : $Rights" -ForegroundColor Magenta
                    $ReturnACEObjTypeTable = $null
                    $ReturnACEObjTable = $null
                    $ReturnACEObjTypeTable = [Ordered]@{}
                    $ReturnACEObjTable = [Ordered]@{}
                    If ($Rights="objectType"){
                        # Right
                        $_.Right | ForEach {
                            $Right = $_.Name
                            $Value = $_.Value
                            $Type = $_.Type
                            Write-Host "      Right : $Type / $Right / $Value" -ForegroundColor Gray
                            Switch ($Right){
                                "ADRights"{[System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTypeTable.ADRights = $Value}
                                "AccessControlType"{[System.Security.AccessControl.AccessControlType]$ReturnACEObjTypeTable.AccessControlType = $Value}
                                "ObjectType"{[GUID]$ReturnACEObjTypeTable.ObjectType = $Value}
                                "InheritanceType"{[System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTypeTable.InheritanceType = $Value}
                                "InheritedObjectType"{[GUID]$ReturnACEObjTypeTable.InheritedObjectType = $Value}
                            }
                        }
                    } elseif ($Rights="object") {
                        # Right
                        $_.Right | ForEach {
                            $Right = $_.Name
                            $Value = $_.Value
                            $Type = $_.Type
                            Write-Host "      Right : $Type / $Right / $Value" -ForegroundColor Gray
                            Switch ($Right){
                                "ADRights"{[System.DirectoryServices.ActiveDirectoryRights]$ReturnACEObjTable.ADRights = $Value}
                                "AccessControlType"{[System.Security.AccessControl.AccessControlType]$ReturnACEObjTable.AccessControlType = $Value}
                                "ObjectType"{[GUID]$ReturnACEObjTable.ObjectType = $Value}
                                "InheritanceType"{[System.DirectoryServices.ActiveDirectorySecurityInheritance]$ReturnACEObjTable.InheritanceType = $Value}
                                "InheritedObjectType"{[GUID]$ReturnACEObjTable.InheritedObjectType = $Value}
                            }
                        }
                    } Else {
                    }
                    "---- ObjectType ----"
                    $ReturnACEObjectType = New-Object -TypeName psobject -Property $ReturnACEObjTypeTable
                    $ReturnACEObjectType
                    "---- Object ----"
                    $ReturnACEObject = New-Object -TypeName psobject -Property $ReturnACEObjTable
                    $ReturnACEObject
                }
            }
            # ---------
            # Set ACL for Object Type
            $ReturnACEObjectType = ACEObjectType $ObjectType
            $objACEObjType = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
                $ReturnACEObjectType.ADRights,`
                $ReturnACEObjectType.AccessControlType,`
                $ReturnACEObjectType.ObjectType,`
                $ReturnACEObjectType.InheritanceType,`
                $ReturnACEObjectType.InheritedObjectType
            $objACEObjType
            $objACL.AddAccessRule($objACEObjType)
            Try {
                # Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
            }
            Catch [Microsoft.ActiveDirectory.Management.ADException]{
                Write-Host "Access denied" -ForegroundColor Magenta
            }
            Catch {
                Write-Host "Something else bad request" -ForegroundColor Magenta
            }
        }
    }


}


<#
# PSDrive
$DC = (Get-ADDomain $Domain).InfrastructureMaster
$DomainDN = (Get-ADDomain $Domain).DistinguishedName
$Location = $Domain +":"
$Cred = Get-Credential -Credential "$Domain\"
New-PSDrive -Name $Domain -PSProvider ActiveDirectory -Server $DC -scope Global -root "//rootDSE/" -Credential $Cred

# Check object found
$SID = [System.Security.Principal.SecurityIdentifier](Get-ADObject -Filter 'Name -eq $Account' -Properties ObjectSID).ObjectSID.Value
If ($SID.Count -ne "0") {
    $Continue = $True
} Else {
    $Continue = $False
    Write-Host "Account not found" -ForegroundColor Magenta
    Break
}
# Set Organizational Unit
# $OU = "OU=ACL,OU=DEV,DC=res,DC=bngf,DC=local"
$OU = $OrganizationalUnit+","+$DomainDN
$Path = $Domain+":\"+$OU
Write-Host "Path : $Path" -ForegroundColor Yellow
Try {
    Get-ACL -Path $Path -ErrorAction stop | Out-Null
}
Catch [Microsoft.ActiveDirectory.Management.ADReferralException] {
    $Continue = $False
    Write-Host "OU not found" -ForegroundColor Magenta
    Break
}
Catch {
    $Continue = $False
    Write-Host "Something else bad request" -ForegroundColor Magenta
    Break
}

If ($Continue -eq $True) {
    $Identity = [System.Security.Principal.IdentityReference] $SID
    # Retrieve ACLs
    $objACL = Get-ACL -Path $Path
    # Set ACL for Object Type
    $ReturnACEObjectType = ACEObjectType $ObjectType
    $objACEObjType = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
        $ReturnACEObjectType.ADRights,`
        $ReturnACEObjectType.AccessControlType,`
        $ReturnACEObjectType.ObjectType,`
        $ReturnACEObjectType.InheritanceType,`
        $ReturnACEObjectType.InheritedObjectType
    $objACEObjType
    $objACL.AddAccessRule($objACEObjType)
    Try {
        Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
    }
    Catch [Microsoft.ActiveDirectory.Management.ADException]{
        Write-Host "Access denied" -ForegroundColor Magenta
    }
    Catch {
        Write-Host "Something else bad request" -ForegroundColor Magenta
    }

    
    # Set ACL for Object
    $ReturnACEObject = ACEObject $ObjectType
    $objACEObj = New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $Identity, ` # SID
        $ReturnACEObject.ADRights,`
        $ReturnACEObject.AccessControlType,`
        $ReturnACEObject.ObjectType,`
        $ReturnACEObject.InheritanceType,`
        $ReturnACEObject.InheritedObjectType
    $objACEObj
    $objACL.AddAccessRule($objACEObj)
    Try {
        Set-acl -AclObject $objACL -Path $Path -ErrorAction stop | Out-Null
    }
    Catch [Microsoft.ActiveDirectory.Management.ADException]{
        Write-Host "Access denied" -ForegroundColor Magenta
    }
    Catch {
        Write-Host "Something else bad request" -ForegroundColor Magenta
    }
    
}
Set-Location C:
Remove-PSDrive $Domain
#>
>>>>>>> 6094e76ba610ca1a34af884851244e63d104dbe1
