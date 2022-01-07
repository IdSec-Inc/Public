Function LoadProfile {
    <#
    .SYNOPSIS
    Offering a tab to select which profile do you want to use.

    .DESCRIPTION
    Offering a tab to select which profile do you want to use.
    To load different profile or switch profile

    .EXAMPLE
    PS> LoadProfile

    .NOTES
    ....
    #>
    Try{
        stop-transcript|out-null
      }
      Catch [System.InvalidOperationException]{}

    ## Variables
    $UserName = [Environment]::UserName
    $PowershellProfilePath = (Get-Item $PROFILE.CurrentUserCurrentHost).PSParentPath

    ## Load JSON
    $Profiles = Get-Content -Raw -Path "$PowershellProfilePath\Modules\Powershell-Profile\Config.json" | ConvertFrom-Json
    $Global:TranscriptFolder = $Profiles.TranscriptFolder
    $Global:SelectedProfile = $Profiles.List | Out-Gridview -OutputMode Single
    If (($($SelectedProfile.Account).Count) -ne 1) {
        Write-Host "Select one option" -ForegroundColor Red
    } Else {

        #####################################################
        $Histo = (" Current : V0.1
        Powershell Profile $($SelectedProfile.TenantName)
        v0.1 - Creation - 2021-07-30 - Mathias Dumont
        v0.2 - New function - 2021-09-21 - Mathias Dumont
        ")
        #####################################################

        # ============ PSDefaultParameterValues =================
        $PSDefaultParameterValues['Export-CSV:Delimiter'] = ";"
        $PSDefaultParameterValues['Export-CSV:NoTypeInformation'] = $true
        $PSDefaultParameterValues['Export-CSV:Encoding'] = "Default"
    
        # ============ Alias ============
        New-Alias -Name gh  -Value Get-Help       -Description "glm"
        New-Alias -Name gmh -Value moreHelp       -Description "glm"

        # ============ Function ==============
        #--------------------------------------------------------------
        Function Histo {
            write-host $histo
        }
        # ============ Initialise Powershell ===========================
        cls
        "Loading..."
        (get-host).UI.RawUI.windowTitle = "Tenant $($SelectedProfile.TenantName)" 
        (get-host).privatedata.ErrorBackgroundColor = "darkblue"

        "Chargement..."

        $host.PrivateData.ErrorForegroundColor = "green"

        Write-Host -ForegroundColor yellow @"
Profil personalisé pour $($SelectedProfile.TenantName) - Bienvenue $UserName
===============================

        Tenant: $($SelectedProfile.TenantName)
        Account: $($SelectedProfile.Account)
        Role: $($SelectedProfile.Role)

===============================
       
Emplacement par défaut $($SelectedProfile.Folder)
Transcript sauvegardé dans $TranscriptFolder

Session démarrée à : $(get-date)
"@
        Write-Host -ForegroundColor yellow "Dernière modification du profile $($SelectedProfile.TenantName) :" (Get-Item "$PowershellProfilePath\Modules\Powershell-Profile\Powershell-Profile.psm1").LastWriteTime
        Set-Location -Path $($SelectedProfile.Folder)
    }
}

Function startTranscript() {
    <#
    .SYNOPSIS
    Start transcript.

    .DESCRIPTION
    Start transcript.
    Save datas to transcript file

    .EXAMPLE
    PS> startTranscript

    .NOTES
    ....
    #>
    $dte = (get-date).tostring()
    $dte = $dte -replace "[:\s/]","."
    start-transcript -path "$TranscriptFolder\$($SelectedProfile.TenantName)-$dte.txt"
}

Function stopTranscript() {
    <#
    .SYNOPSIS
    Stop transcript
    
    .DESCRIPTION
    stop-transcript
    
    .EXAMPLE
    PS> StopTranscript
    
    .NOTES
    ....
    #>
        stop-Transcript
    }
#===================
#    Connection to module
#===================
Function ConnectAAD {
    <#
    .SYNOPSIS
    Connect to Azure AD with UPN included in json file

    .DESCRIPTION
    Connect to Azure AD with UPN included in json file

    .EXAMPLE
    PS> Connect-AzureAD -AccountId $($SelectedProfile.Account)

    .NOTES
    ....
    #>
    Connect-AzureAD -AccountId $($SelectedProfile.Account)
}

Function ConnectEXO() {
    <#
    .SYNOPSIS
    Connect to ExchangeOnline with UPN included in json file

    .DESCRIPTION
    Connect to ExchangeOnline with UPN included in json file

    .EXAMPLE
    PS> Connect-ExchangeOnline -UserPrincipalName $($SelectedProfile.Account)

    .NOTES
    ....
    #>
    Connect-ExchangeOnline -UserPrincipalName $($SelectedProfile.Account)
}

Function DisconnectEXO() {
    <#
    .SYNOPSIS
    Disconnect to ExchangeOnline
    
    .DESCRIPTION
    Disconnect to ExchangeOnline
    
    .EXAMPLE
    PS> Disconnect-ExchangeOnline
    
    .NOTES
    ....
    #>
        Disconnect-ExchangeOnline
}

#===================
#    Exchange Online
#===================
Function Get-ModernAuth() {
    <#
    .SYNOPSIS
    Disconnect to ExchangeOnline
    
    .DESCRIPTION
    Disconnect to ExchangeOnline
    
    .EXAMPLE
    PS> Disconnect-ExchangeOnline
    
    .NOTES
    Source: https://docs.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/enable-or-disable-modern-authentication-in-exchange-online
    #>
    $Status = $(Get-OrganizationConfig).OAuth2ClientProfileEnabled
    Write-Host "Status: $Status" -ForegroundColor Yellow
    If ($Status -eq $false) {
        Write-Host "It's recommended to enable it ?"
    }
    # Enable Modern Auth (it's not a block access): Set-OrganizationConfig -OAuth2ClientProfileEnabled $true
    # Disable Modern Auth (force Basic Auth): Set-OrganizationConfig -OAuth2ClientProfileEnabled $false
}

Function Get-AuthPolicies {
    <#
    .SYNOPSIS
    Disconnect to ExchangeOnline
    
    .DESCRIPTION
    Disconnect to ExchangeOnline
    
    .EXAMPLE
    PS> Disconnect-ExchangeOnline
    
    .NOTES
    Source: https://docs.microsoft.com/en-us/powershell/module/exchange/set-authenticationpolicy?view=exchange-ps
    #>
    $Status = $(Get-OrganizationConfig).DefaultAuthenticationPolicy
    Get-AuthenticationPolicy | ft Name -Auto

    # Create Auth Default Policy
    #Set-AuthenticationPolicy -Identity "Block Basic Auth" -AllowBasicAuthPop -AllowBasicAuthImap:$false

    # Set Defautl Policy to organization
    Set-OrganizationConfig -DefaultAuthenticationPolicy "Block Basic Auth"
}

Function Disable-BasicAuth {
    <#
    .SYNOPSIS
    Disconnect to ExchangeOnline
    
    .DESCRIPTION
    Disconnect to ExchangeOnline
    
    .EXAMPLE
    PS> Disconnect-ExchangeOnline
    
    .NOTES
    # Source: https://docs.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/disable-basic-authentication-in-exchange-online
#>


}

Function Disable-BasicAuth {
    <#
    .SYNOPSIS
    Disconnect to ExchangeOnline

    .DESCRIPTION
    Disconnect to ExchangeOnline

    .EXAMPLE
    PS> Disconnect-ExchangeOnline

    .NOTES
    # Source: https://docs.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/authenticated-client-smtp-submission
#>


}