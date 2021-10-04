<#
.SYNOPSIS
List Cipher config

.DESCRIPTION
Find the value for cyphers config

.EXAMPLE
PS :\> Get-Ciphers

.NOTES
Created by Mathias DUMONT
#>
Function GetPKICipherReg {	
	$ReturnValues = new-object PSObject
	$Time = Get-Date

	#Ciphers
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128")
		{$RC4128128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128")
		{$AES128128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256")
		{$AES256256Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168")
		{$TripleDES168Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128")
		{$RC456128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56")
		{$DES5656Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128")
		{$RC440128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128")
		{$AES128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256")
		{$AES256Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56")
		{$DES56Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL")
		{$NULLReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL"}
	if (Test-path -path Registry::"HKLM\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002")
		{$NCRYPTSChannelReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002"}
	if (Test-path -path Registry::"HKLM\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010003")
		{$NCRYPTSChannelSigReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010003"}	
	#items below are problematic if enabled or disabled.
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128")
		{$RC240128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128")
		{$RC2128128Reg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128"}

	#hashes
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5")
		{$MD5HashReg = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA")
		{$SHAHashReg = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA}

	#Disabling RSA use in KeyExchange PKCS 
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS")
		{$PKCSKeyXReg = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS}

	#SSL
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client")
			{$PCT1ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server")
			{$PCT1ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client")
		{$SSL2ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server")
		{$SSL2ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client")
		{$SSL3ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server")
		{$SSL3ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server"}
	
    if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client")
		{$TLS1ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server")
		{$TLS1ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server"}
	
    if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client")
		{$TLS11ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server")
		{$TLS11ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server"}
	
    if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client")
		{$TLS12ClientReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"}
	if (Test-path -path Registry::"HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server")
		{$TLS12ServerReg = Get-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server"}
	

	#Begin adding data to PSObject.
	add-member -inputobject $ReturnValues -membertype noteproperty -name "Time" -value $Time
	# If registry values below are populated with specific values then alert the engineer and customer since this will effect SSL/TLS and perhaps other cipher uses.

	if (($FIPSReg.Enabled -ne $null) -or ($PCT1ClientReg.Enabled -eq 0 ) -or ($PCT1ServerReg.Enabled -eq 0 ) -or ($SSL2ClientReg.Enabled -eq 0) -or ($SSL2ServerReg.Enabled -eq 0) -or `
	($SSL3ClientReg.Enabled -eq 0) -or ($SSL3ClientReg.Enabled -eq 0) -or ($SSL3ServerReg.Enabled -eq 0) -or ($MD5HashReg.Enabled -eq 0) -or ($SHAHashReg.Enabled -eq 0) -or ($PKCSKeyXReg.Enabled -eq 0)`
	 -or ($RC4128128Reg.Enabled -eq 0) -or ($AES128128Reg.Enabled -eq 0) -or ($AES256256Reg.Enabled -eq 0) -or ($TripleDES168Reg.Enabled -eq 0) -or ($RC456128Reg.Enabled -eq 0) -or ($DES5656Reg.Enabled -eq 0) `
	 -or ($RC440128Reg.Enabled -eq 0) -or ($AES128Reg.Enabled -eq 0) -or ($AES256Reg.Enabled -eq 0) -or ($NULLReg.Enabled -eq 0) -or ($RC240128Reg.Enabled -ne $null) -or ($DES56Reg.Enabled -eq 0)`
	  -or ($RC2128128Reg.Enabled -ne $null) )
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Customized Settings" -value $true}
			else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Customized Settings" -value $false}
	
	add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL Certificate Etypes Allowed" -value $NCRYPTSChannelReg.Functions
	add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL Certificate Signature Etypes Allowed" -value $NCRYPTSChannelSigReg.Functions
    if ($OSVersion.BuildNumber -eq 3790)
    {
	if (($PCT1ClientReg.Enabled -eq 1) -or ($PCT1ClientReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Client Setting" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Client Setting" -value "Disabled (NOT default)"}
    if (($PCT1ServerReg.Enabled -eq 1) -or ($PCT1ServerReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Server Setting" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Server Setting" -value "Disabled (NOT default)"}
    }

    if ($OSVersion.BuildNumber -ge 3790)
    {
	if (($PCT1ClientReg.Enabled -eq 0) -or ($PCT1ClientReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Client Setting" -value "Disabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Client Setting" -value "Enabled (NOT default)"}
    if (($PCT1ServerReg.Enabled -eq 0) -or ($PCT1ServerReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Server Setting" -value "Disabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "PCT1 Server Setting" -value "Enabled (NOT default)"}
    }




    if (($SSL2ClientReg.Enabled -eq 1) -or ($SSL2ClientReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL2 Client Setting" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL2 Client Setting" -value "Disabled (NOT default)"}
    if (($SSL2ServerReg.Enabled -eq 1) -or ($SSL2ServerReg.Enabled -eq $null))
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL2 Server Setting" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL2 Server Setting" -value "Disabled (NOT default)"}
	 if (($SSL3ClientReg.Enabled -eq 1) -or ($SSL3ClientReg.Enabled -eq $null))	
		 {add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL3 Client Setting" -value "Enabled (default)"}
		else
			 {add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL3 Client Setting" -value "Disabled (NOT default) for POODLE"}
	 if (($SSL3ServerReg.Enabled -eq 1) -or ($SSL3ServerReg.Enabled -eq $null))	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL3 Server Setting" -value "Enabled (default) - POODLE still possible"}
		else
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "SSL3 Server Setting" -value "Disabled (NOT Default) for POODLE"}
	 
    if (($TLS1ClientReg.Enabled -eq 1) -or ($TLS1ClientReg.Enabled -eq $null))	
		 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.0 Client Setting" -value "Enabled (default)"}
		else
			 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.0 Client Setting" -value "Disabled (NOT default)"}
	 if (($TLS1ServerReg.Enabled -eq 1) -or ($TLS1ServerReg.Enabled -eq $null))	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.0 Server Setting" -value "Enabled (default)"}
		else
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.0 Server Setting" -value "Disabled (NOT Default)"}
	 
    if (($TLS11ClientReg.Enabled -eq 1) -or ($TLS11ClientReg.Enabled -eq $null))	
		 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.1 Client Setting" -value "Enabled (default)"}
		else
			 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.1 Client Setting" -value "Disabled (NOT default)"}
	 if (($TLS11ServerReg.Enabled -eq 1) -or ($TLS11ServerReg.Enabled -eq $null))	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.1 Server Setting" -value "Enabled (default)"}
		else
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.1 Server Setting" -value "Disabled (NOT Default)"}
	 
    if (($TLS12ClientReg.Enabled -eq 1) -or ($TLS12ClientReg.Enabled -eq $null))	
		 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.2 Client Setting" -value "Enabled (default)"}
		else
			 {add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.2 Client Setting" -value "Disabled (NOT default)"}
	 if (($TLS12ServerReg.Enabled -eq 1) -or ($TLS12ServerReg.Enabled -eq $null))	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.2 Server Setting" -value "Enabled (default)"}
		else
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "TLS 1.2 Server Setting" -value "Disabled (NOT Default)"}
    if ($FIPSReg.Enabled -eq 1)	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "FIPS Setting" -value "Enabled (default)"}
		else
			 {add-member -inputobject $ReturnValues -membertype noteproperty -name "FIPS Setting" -value "Not Enabled (default)"}
	 if (($RC4128128Reg.Enabled -eq 1) -or ($RC4128128Reg.Enabled -eq $null))	
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 128/128 " -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 128/128 " -value "Disabled (NOT default)"}

	if (($RC456128Reg.Enabled -eq 1) -or ($RC456128Reg.Enabled -eq $null))		
	{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 56/128" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 56/128" -value "Disabled (NOT default)"}

	if (($RC440128Reg.Enabled -eq 1) -or ($RC440128Reg.Enabled -eq $null))		
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 40/128" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: RC4 40/128" -value "Disabled (NOT default)"}
	
	if ($OSVersion.BuildNumber -ge 6002)
	{
		if (($DES56Reg.Enabled -eq 1) -or ($DES56Reg.Enabled -eq $null))		
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: DES 56" -value "Enabled (default)"}
			else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: DES 56" -value "Disabled (NOT default)"}
		if (($TripleDES168Reg.Enabled -eq 1) -or ($TripleDES168Reg.Enabled -eq $null))	
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: Triple DES 168" -value "Enabled (default)"}
			else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: Triple DES 168" -value "Disabled (NOT default)"}
		if (($AES128Reg.Enabled -eq 1) -or ($AES128Reg.Enabled -eq $null))	
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 128" -value "Enabled (default)"}
			else
				{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 128" -value "Disabled (NOT default)"}
		if (($AES256Reg.Enabled -eq 1) -or ($AES256Reg.Enabled -eq $null))	
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 256" -value "Enabled (default)"}
			else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 256" -value "Disabled (NOT default)"}
		}
	if ($OSVersion.BuildNumber -eq 3790)
	{
	  if (($AES128128Reg.Enabled -eq 1) -or ($AES128128Reg.Enabled -eq $null))		
	  {add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 128/128" -value "Enabled (default)"}
		else
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 128/128" -value "Disabled (NOT default)"}
	  if (($AES256256Reg.Enabled -eq 1) -or ($AES256256Reg.Enabled -eq $null))		
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 256/256" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: AES 256/256" -value "Disabled (NOT default)"}

		if (($DES5656Reg.Enabled -eq 1) -or ($DES5656Reg.Enabled -eq $null))		
		{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: DES 56/56" -value "Enabled (default)"}
			else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Cipher Setting: DES 56/56" -value "Disabled (NOT default)"}
		}
	 
	 #HashReg Values
	 if (($SHAHashReg.Enabled -eq 1) -or ($SHAHashReg.Enabled -eq $null))	
	 	{add-member -inputobject $ReturnValues -membertype noteproperty -name "Secure Hash Algorithm (SHA-1) Use" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "Secure Hash Algorithm (SHA-1) Use" -value "Disabled (NOT default)"}
	 if (($MD5HashReg.Enabled -eq 1) -or ($MD5HashReg.Enabled -eq $null))	
	 	{add-member -inputobject $ReturnValues -membertype noteproperty -name "MD5 Hash Algorithm Use" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "MD5 Hash Algorithm Use" -value "Disabled (NOT default)"}
	 #PKCS Key Exchange use.
	 if (($PKCSKeyXReg.Enabled -eq 1) -or ($PKCSKeyXReg.Enabled -eq $null))	
	 	{add-member -inputobject $ReturnValues -membertype noteproperty -name "RSA Key Exchange Use" -value "Enabled (default)"}
		else
			{add-member -inputobject $ReturnValues -membertype noteproperty -name "RSA Key Exchange Use" -value "Disabled (NOT default)"}

	 return $ReturnValues

}

# Define output file.
$OutputFileName = ".\" + (($env:COMPUTERNAME) + "_PKICryptoSettings.txt")

$InformationCollected = new-object PSObject
$InformationCollected = GetPKICipherReg
	

"SSL, TLS and Cipher Registry Values" | Out-File -Encoding UTF8 -FilePath $OutputFileName 
"***************************************" | Out-File -Encoding UTF8 -FilePath $OutputFileName -append
$InformationCollected | Out-File -Encoding UTF8 -FilePath $OutputFileName -append
Write-Host "Results are saved to $OutputFileName"